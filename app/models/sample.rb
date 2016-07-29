class Sample < ApplicationRecord
#attr_accessible 

    #validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

	def self.import(file)
	  spreadsheet = open_spreadsheet(file)
	  headerrow = spreadsheet.row(1)
	  headers = Hash.new
	  spreadsheet.row(1).each_with_index {|header,i| headers[header] = i}
	 
	 
	  (2..spreadsheet.last_row).each do |i|
	    row = Hash[[headerrow, spreadsheet.row(i)].transpose]
	    sample = find_by_id(row["id"]) || new
	    title = spreadsheet.row(i)[headers['Title']] 
	    initial = spreadsheet.row(i)[headers['Initial']]
	    surname = spreadsheet.row(i)[headers['Surname']]
	    email = spreadsheet.row(i)[headers['Email']]
	    mobile = spreadsheet.row(i)[headers['Mobile']]
	    isEmailValid = check_email(email)
	    isTitleValid = check_title(title)
	    isSurnameValid = check_surname(surname)
	    isMobileValid = check_mobile(mobile)
	    
	    errorMessage = CheckforErrors(isEmailValid,isTitleValid,isSurnameValid,isMobileValid)

	    if(errorMessage.length > 0)
	     @error = Error.new
	    	@error.Title = title
	    	@error.Initial = initial
	    	@error.Surname = surname
	    	@error.Email = email
	    	@error.Mobile = mobile
	    	@error.Error = errorMessage
	    	@error.save
	    else
	    	sample.attributes = row.to_hash.slice(*row.to_hash.keys)
	    	sample.save!
	    end
	    
	  end
	end



	def self.open_spreadsheet(file)
	  case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path, packed: nil, file_warning: :ignore)
	  when ".xls" then Roo::Excel.new(file.path, packed: nil, file_warning: :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, packed: nil, file_warning: :ignore)
	  else 
   		 raise "Unknown file type: #{file.original_filename}"
 	  end
	end


	def self.check_email(email)
		#VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
		#if email.length > 0 
  		/\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i === email
	end

	def self.check_title(title)
		if title.to_s.length > 0
			return true
		else
			return false
		end
	end

	def self.check_mobile(mobile)
		if mobile.to_s.length > 0
			return true
		else
			return false
		end
	end

	def self.check_surname(surname)
		if surname.to_s.length > 0
			return true
		else
			return false
		end
	end

	def self.CheckforErrors(isEmailValid,isTitleValid,isSurnameValid,isMobileValid)
		error = ""
		if isEmailValid == false
			error = "Enter a valid Email,"
		end
	
		if isTitleValid == false
			error = error.to_s + "Enter a valid Title,"
		end

		if isSurnameValid == false
			error = error.to_s + "Enter a valid Surname,"
		end

		if isMobileValid == false
			error = error.to_s + "Enter a valid Mobile"
		end

		return error
	end

 end

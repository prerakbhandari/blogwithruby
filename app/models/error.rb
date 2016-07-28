class Error < ApplicationRecord

	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
			csv << column_names
			p "&^&^&*(*(*(()*)*)*&^$$%#{}"
			
			#p options
			p column_names

			all.each do |error|
				#p sample
				csv << [error.id, error.Title, error.Initial, error.Surname, error.Mobile, error.Error]#error.attributes.value_at(*column_names)
			end
		end
	end

end


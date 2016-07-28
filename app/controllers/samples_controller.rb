class SamplesController < ApplicationController
  def index
    @errors = Error.order(:id)
    @samples = Sample.order(:id)
    respond_to do |format|
      format.html
      #format.csv { send_data @errors.to_csv }
      format.xls #{ send_data @errors.to_csv(col_sep: "\t") }

    end
  end

  def new
  end

  def create
  end

  def destroy
  end

  def import
	    Sample.import(params[:file])
  		redirect_to root_url, notice: "Samples imported."
	end

end

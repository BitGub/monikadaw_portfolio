class UploadsController < ApplicationController
  
  def index
    @uploads = Upload.all
  end
  
  def new
    @upload = Upload.new  
  end
  
  def create
    @upload = Upload.new(upload_params)
    if @upload.save
      redirect_to uploads_path, notice:  "Your profile has been successfully updated."
    end
  end
  
  def edit
  end
  
  private
  
    def upload_params
      params.require(:upload).permit(:upload, :title, :description)
    end
  
  
end
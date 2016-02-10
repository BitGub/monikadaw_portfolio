class Admin::UploadsController < ApplicationController
  before_action :authorize
  
  def index
    @uploads = Upload.all
  end
  
  def new
    @upload = Upload.new  
  end
  
  def create
    @upload = Upload.new(upload_params)
    if @upload.save
      flash[:sucess] = "upload saved!"
      redirect_to admin_uploads_path
    end
  end
  
  def edit
    @upload = Upload.find(params[:id])
  end
  
  def update
    @upload = Upload.find(params[:id])
        if @upload.update_attributes(upload_params)
          flash[:sucess] = "upload saved!"
          redirect_to admin_uploads_path
        else
          flash[:danger] = "invalid submission"
          render 'edit'
        end
  end
  
  private
  
    def upload_params
      params.require(:upload).permit(:upload, :title, :description, :year, :position)
    end
  
  
end
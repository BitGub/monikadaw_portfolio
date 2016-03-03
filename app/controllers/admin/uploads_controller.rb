class Admin::UploadsController < ApplicationController
  before_action :authorize
  
  def index
    @uploads = Upload.where(trashed: false)
  end
  
  def new
    @upload = Upload.new  
  end
  
  def create
    @upload = Upload.new(upload_params)
    @upload.user_id = current_user.id
    if @upload.save
      flash[:success] = "upload saved!"
      redirect_to admin_uploads_path
    end
  end
  
  def edit
    @upload = Upload.find(params[:id])
  end
  
  def update
    @upload = Upload.find(params[:id])
        if @upload.update_attributes(upload_params)
          flash[:success] = "upload saved!"
          redirect_to admin_uploads_path
        else
          flash[:danger] = "invalid submission"
          render 'edit'
        end
  end
  
  def archive
    Upload.archive(params[:id])
    @uploads = Upload.where(trashed: false)
    respond_to do |format|
      format.js {}
      flash.now[:success]="Archive successful"
    end
  end
  
  private
  
    def upload_params
      params.require(:upload).permit(:upload, :upload_cache, :title, :description, :position, :user_id)
    end
  
  
end
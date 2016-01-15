class UploadsController < ApplicationController
  
  def index
    @uploads = Upload.all.order('position ASC')
    @uploads_by_year = @uploads.group_by { |upload| upload.year }
  end
  
  def new
    @upload = Upload.new  
  end
  
  def create
    @upload = Upload.new(upload_params)
    if @upload.save
      redirect_to uploads_path, notice:  "Upload saved!"
    end
  end
  
  def edit
    @upload = Upload.find(params[:id])
  end
  
  def update
    @upload = Upload.find(params[:id])
        if @upload.update_attributes(upload_params)
          redirect_to uploads_path, notice:  "Upload updated!"
        else
          render 'edit'
        end
  end
  
  private
  
    def upload_params
      params.require(:upload).permit(:upload, :title, :description, :year, :position)
    end
  
  
end
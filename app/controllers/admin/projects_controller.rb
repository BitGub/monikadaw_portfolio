class Admin::ProjectsController < ApplicationController
  before_action :authorize
  
  def index
    @projects = Project.where(trashed: false)
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(project_params)
    @project.upload_ids = session[:upload_ids] if session[:upload_ids]
    if @project.save
      session[:upload_ids] = nil
      flash[:success] = "Project Successfully Created!"
      redirect_to admin_projects_path
    else
      render 'new'
    end
  end
  
  def edit
    @project = Project.find(params[:id])
    @uploads = Upload.all
  end
  
  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      @project.upload_ids = session[:upload_ids] if session[:upload_ids]
      flash[:success] = "Project Successfully updated!"
      redirect_to admin_projects_path
    else
      render 'edit'
    end
  end
  
  def show_uploads_browser
    @uploads = Upload.all
    @project = Project.where(params[:id]).first
    
  end
  
  def attach
    render nothing: true
    session[:upload_ids] = params[:upload_ids]
  end
  
  def archive
    Project.archive(params[:id])
    @projects = Project.where(trashed: false)
    respond_to do |format|
      format.js {}
      flash.now[:success]="Archive successful"
    end
  end
  
  private
    def project_params
      params.require(:project).permit(:category_id, :name, :description, :year, :public, upload_ids: [])
    end
end
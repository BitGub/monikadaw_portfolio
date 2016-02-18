class Admin::ProjectsController < ApplicationController
  before_action :authorize
  
  def index
    @projects = Project.all
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "Project Successfully Created!"
      redirect_to projects_path
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
      flash[:success] = "Project Successfully updated!"
      redirect_to projects_path
    else
      render 'edit'
    end
  end
  
  # def show_uploads_browser
  #
  # end
  
  private
    def project_params
      params.require(:project).permit(:category_id, :name, :description, :year, upload_ids: [])
    end
end
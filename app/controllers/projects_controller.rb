class ProjectsController < ApplicationController
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
  
  private
    def project_params
      params.require(:project).permit(:category_id, :name, :description, :year)
    end
end
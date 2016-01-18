class UsersController < ApplicationController
  before_action :authorize
  
  def index
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Settings updated"
      redirect_to uploads_path
    else
      flash.now[:danger] = "Invalid form submission"
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email)
    end
end

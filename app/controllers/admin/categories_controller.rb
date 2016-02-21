class Admin::CategoriesController < ApplicationController
  before_action :authorize
  
  def index
    @categories = Category.where(trashed: false)
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category saved!"
      redirect_to admin_categories_path
    else
      render 'new'
    end
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = "Category Updated!"
      redirect_to admin_categories_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:success] = "Category Deleted"
    redirect_to admin_categories_path
  end
  
  def archive
    Category.archive(params[:id])
    @categories = Category.where(trashed: false)
    respond_to do |format|
      format.js {}
      flash.now[:success]="Archive successful"
    end
  end
  
  private
  
    def category_params
      params.require(:category).permit(:name, :public)
    end
end
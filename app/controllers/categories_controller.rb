class CategoriesController < ApplicationController
  before_action :authorize
  
  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category saved!"
      redirect_to categories_path
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
      redirect_to categories_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:success] = "Category Deleted"
    redirect_to categories_path
  end
  
  private
  
    def category_params
      params.require(:category).permit(:name)
    end
end
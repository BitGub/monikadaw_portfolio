class HomesController < ApplicationController
  layout 'public'
  
  def index
    @categories = Category.select(:name, :id).where(public: true)
    query = params[:id] || @categories.first 
    @projects = Project.includes(:uploads).group(:year).where(category_id: query, public: true)
  end
  
  def listings
  end

end
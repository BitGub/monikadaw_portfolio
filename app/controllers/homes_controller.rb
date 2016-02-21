class HomesController < ApplicationController
  layout 'public'
  
  def index
    @categories = Category.categorized.select(:name, :id).where(public: true, trashed: false)
    query = params[:id] || @categories.first 
    @projects = Project.includes(:uploads).group(:year).where(category_id: query, public: true)
  end
  
  def listings
  end

end
class HomesController < ApplicationController
  layout 'public'
  
  def index
    query = params[:id] || 4 
    @categories = Category.select(:name, :id).where(public: true)
    @projects = Project.includes(:uploads).group(:year).where(category_id: query)
  end
  
  def listings
  end

end
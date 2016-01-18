class HomeController < ApplicationController
  layout 'public'
  
  def index
    @photos = Upload.group(:year).where(:position => 0)
  end

end
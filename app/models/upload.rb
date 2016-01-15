class Upload < ActiveRecord::Base
  
  # scope :by_year, -> { group(year: :asc) }
  # scope :by_position, -> { by_year.order(position: :desc) }
  
  mount_uploader :upload, ImageUploader
end

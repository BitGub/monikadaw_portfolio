class Upload < ActiveRecord::Base
  has_and_belongs_to_many :projects
  
  # scope :by_year, -> { group(year: :asc) }
  # scope :by_position, -> { by_year.order(position: :desc) }
  
  mount_uploader :upload, ImageUploader
end

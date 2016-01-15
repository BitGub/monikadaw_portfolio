class Upload < ActiveRecord::Base
  
  mount_uploader :upload, ImageUploader
end

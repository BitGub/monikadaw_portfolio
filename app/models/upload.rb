class Upload < ActiveRecord::Base
  has_and_belongs_to_many :projects
  
  mount_uploader :upload, ImageUploader
  
  def self.archive(id)
    update([id], [{trashed: true}])
  end
end

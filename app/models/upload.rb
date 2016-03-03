class Upload < ActiveRecord::Base
  has_and_belongs_to_many :projects
  belongs_to :user
  
  mount_uploader :upload, ImageUploader
  
  def self.archive(id)
    update([id], [{trashed: true}])
  end
end

class Category < ActiveRecord::Base
   validates :name, uniqueness: true, presence: true
   
   has_many :projects
   
   def self.archive(id)
     update([id], [{trashed: true}])
   end
end

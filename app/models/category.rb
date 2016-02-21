class Category < ActiveRecord::Base
   validates :name, uniqueness: true, presence: true
   
   has_many :projects
   
   scope :categorized, -> { where.not(name: "Uncategorized") }
   
   after_save :archive_and_hide_projects, if: :archived?
   
   def self.archive(id)
     update([id], [{trashed: true}])
   end
   
   def archived?
     self.trashed?
   end
   
   def archive_and_hide_projects
     if self.projects
       uncategorized = Category.find_by(name: "Uncategorized")
       self.projects.update_all(trashed: true, public: false, category_id: uncategorized.id)
     end
   end
   
end



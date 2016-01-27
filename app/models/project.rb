class Project < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :uploads
  
  validates :category_id, presence: true
  validates :year, presence: true
  validates :name, presence: true
end

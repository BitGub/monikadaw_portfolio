class AddYearAndPositionToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :year, :integer
    add_column :uploads, :position, :integer
    change_column :uploads, :description, :text
  end
end

class AddsTrashedBooleanToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :trashed, :boolean, null: false
  end
end

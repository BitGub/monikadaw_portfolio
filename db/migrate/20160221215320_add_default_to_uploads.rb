class AddDefaultToUploads < ActiveRecord::Migration
  def change
    change_column_default :uploads, :trashed, false
  end
end

class AddUserIdToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :user_id, :integer, add_index: true
  end
end

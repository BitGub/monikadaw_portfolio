class AddTimeStampsToJoinTable < ActiveRecord::Migration
  def change
      add_column :projects_uploads, :created_at, :datetime, null: false
      add_column :projects_uploads, :updated_at, :datetime, null: false
  end
end

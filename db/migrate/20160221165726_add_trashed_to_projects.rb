class AddTrashedToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :trashed, :boolean, null: false
  end
end

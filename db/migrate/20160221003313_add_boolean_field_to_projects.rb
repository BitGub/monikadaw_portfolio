class AddBooleanFieldToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :public, :boolean, null: false
  end
end

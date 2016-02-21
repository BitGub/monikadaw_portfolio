class ChangeTrashedDefaultInProject < ActiveRecord::Migration
  def change
    change_column_default :projects, :trashed, false
    change_column_default :projects, :public, false
  end
end

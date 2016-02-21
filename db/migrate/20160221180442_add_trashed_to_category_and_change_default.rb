class AddTrashedToCategoryAndChangeDefault < ActiveRecord::Migration
  def change
    add_column :categories, :trashed, :boolean, null: false, default: false
    change_column_default :categories, :public, false
  end
end

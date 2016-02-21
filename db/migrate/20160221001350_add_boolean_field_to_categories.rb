class AddBooleanFieldToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :public, :boolean, null: false
  end
end

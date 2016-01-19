class RenameCatergoriesTableToCategories < ActiveRecord::Migration
  def change
    rename_table :catergories, :categories
  end
end

class RemovesStringFields < ActiveRecord::Migration
  def change
    remove_column :users, :string
  end
end

class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.integer :category_id
      t.integer :year 
      t.timestamps null: false
    end
  end
end

class Upload < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :upload
      t.timestamps null: false
    end
  end
end

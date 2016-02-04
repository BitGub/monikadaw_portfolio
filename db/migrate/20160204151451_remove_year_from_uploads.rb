class RemoveYearFromUploads < ActiveRecord::Migration
  def change
    remove_column :uploads, :year
  end
end

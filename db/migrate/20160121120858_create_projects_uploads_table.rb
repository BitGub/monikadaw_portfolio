class CreateProjectsUploadsTable < ActiveRecord::Migration
  def change
    create_table :projects_uploads, id: false do |t|
      t.belongs_to :project, index: true
      t.belongs_to :upload, index: true
    end
  end
end

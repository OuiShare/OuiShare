class CreateProjectsUsers < ActiveRecord::Migration
  def change
    create_table :projects_users do |t|
      t.references :project, index: true
      t.references :user, index: true
    end
  end
end

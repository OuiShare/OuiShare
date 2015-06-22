class CreateCommunitiesProjects < ActiveRecord::Migration
  def change
    create_table :communities_projects do |t|
      t.belongs_to :community, index: true
      t.belongs_to :project, index: true
    end
  end
end

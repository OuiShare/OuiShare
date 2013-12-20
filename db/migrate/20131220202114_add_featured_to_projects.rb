class AddFeaturedToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :featured, :boolean, null: false, default: false
  end
end

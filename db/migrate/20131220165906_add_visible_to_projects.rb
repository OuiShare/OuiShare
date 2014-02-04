class AddVisibleToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :visible, :boolean, null: false, default: true
  end
end

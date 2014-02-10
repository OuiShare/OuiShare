class AddDisplayOnMenuToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :display_on_menu, :boolean, null: false, default: true
  end
end

class AddHomeImageToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :home_image, :string
  end
end

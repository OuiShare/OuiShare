class AddFieldsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :title1, :string
    add_column :projects, :title2, :string
  end
end

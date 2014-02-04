class AddRowOrderToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :row_order, :integer

    execute "UPDATE projects SET row_order = id"
  end
end

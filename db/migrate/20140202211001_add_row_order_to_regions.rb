class AddRowOrderToRegions < ActiveRecord::Migration
  def change
    add_column :regions, :row_order, :integer

    execute "UPDATE regions SET row_order = id"
  end
end

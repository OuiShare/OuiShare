class AddRowOrderToServices < ActiveRecord::Migration
  def change
    add_column :services, :row_order, :integer

    execute "UPDATE services SET row_order = id"
  end
end

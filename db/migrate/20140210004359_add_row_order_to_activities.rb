class AddRowOrderToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :row_order, :integer

    execute "UPDATE activities SET row_order = id"
  end
end

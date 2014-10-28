class AddShowOrderToUsers < ActiveRecord::Migration
  def change
    add_column :users, :show_order, :integer
  end
end

class AddShowOrderToUsers < ActiveRecord::Migration
  def change
    add_column :users, :show_order, :integer, :default => 1000
  end
end

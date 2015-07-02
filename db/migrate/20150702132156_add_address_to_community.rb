class AddAddressToCommunity < ActiveRecord::Migration
  def change
    add_column :communities, :address, :string
  end
end

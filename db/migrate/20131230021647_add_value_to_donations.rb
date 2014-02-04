class AddValueToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :value, :integer
  end
end

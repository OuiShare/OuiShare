class AddCurrencyToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :currency, :string
  end
end

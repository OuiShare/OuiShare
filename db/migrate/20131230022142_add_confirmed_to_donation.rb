class AddConfirmedToDonation < ActiveRecord::Migration
  def change
    add_column :donations, :confirmed, :boolean, null: false, default: false
  end
end

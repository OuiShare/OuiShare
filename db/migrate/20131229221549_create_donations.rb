class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.string :payer_name
      t.string :payment_token
      t.string :payment_id

      t.timestamps
    end
  end
end

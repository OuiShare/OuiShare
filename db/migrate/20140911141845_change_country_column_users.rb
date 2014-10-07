class ChangeCountryColumnUsers < ActiveRecord::Migration
  def change
    rename_column :users, :country_id, :country
    change_column :users, :country, :string
  end
end

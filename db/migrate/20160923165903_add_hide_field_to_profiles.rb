class AddHideFieldToProfiles < ActiveRecord::Migration
  def change
  	add_column :users, :visible, :boolean, null: false, default: true
  end
end

class AddFieldForOsTalentsToUserProfile < ActiveRecord::Migration
  def change
  	add_column :users, :ostalents_url, :string
  end
end

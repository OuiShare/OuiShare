class AddUsersInfos < ActiveRecord::Migration
  def up
    add_column :users, :fname, :string
    add_column :users, :birthday, :date
    add_column :users, :gender, :integer
    add_column :users, :country_id, :integer
    add_column :users, :city, :string
    add_column :users, :prefered_language_id, :integer
    add_column :users, :occupation_id, :integer
    add_column :users, :sector_id, :integer
    add_column :users, :organization_name, :string
    add_column :users, :organization_url, :string
    add_column :users, :user_source_id, :integer
  end

  def down
    remove_column :users, :fname
    remove_column :users, :birthday
    remove_column :users, :gender
    remove_column :users, :country_id
    remove_column :users, :city
    remove_column :users, :prefered_language_id
    remove_column :users, :occupation_id
    remove_column :users, :sector_id
    remove_column :users, :organization_name
    remove_column :users, :organization_url
    remove_column :users, :user_source_id
  end
end

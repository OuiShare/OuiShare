class AddTypeToUser < ActiveRecord::Migration
  def change
    add_column :users, :profile_type, :integer
  end
end

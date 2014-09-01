class ChangeProfileTypeOnUsers < ActiveRecord::Migration
  def change
    change_column :users, :profile_type, :integer, :default => 0, :null => false
  end
end

class ChangeDefaultVisibleOnUser < ActiveRecord::Migration
  def change
  	change_column :users, :visible, :boolean, null: false, default: false
  end
end

class RemoveColumnsectorIdOnUsers < ActiveRecord::Migration
  def change
    remove_column :users, :sector_id
  end
end

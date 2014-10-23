class CreateJoinTableUserSector < ActiveRecord::Migration
  def change
    drop_table :users_sectors
    create_join_table :users, :sectors do |t|
      t.index [:user_id, :sector_id]
      t.index [:sector_id, :user_id]
    end
  end
end

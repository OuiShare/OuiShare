class CreateSectors < ActiveRecord::Migration
  def up
    create_table :sectors do |t|
      t.string :name, :null => false
    end
  
    create_table :users_sectors do |t|
      t.integer :user_id, :null => false
      t.integer :sector_id, :null => false
    end

    add_index :users_sectors, [:user_id, :sector_id]
    add_index :users_sectors, [:sector_id, :user_id]
  end

  def down
    remove_index :users_sectors, column: :user_id
    remove_index :users_sectors, column: :sector_id

    drop_table :users_sectors
    
    drop_table :sectors
  end
end

class AddTableOccupation < ActiveRecord::Migration
  def up
    create_table :occupations do |t|
      t.string :name
    end
  end
  
  def down
    drop_table :occupations
  end
end

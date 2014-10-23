class AddTableTopic < ActiveRecord::Migration
  def up
    create_table :topics do |t|
      t.string :name
    end
  end
  
  def down
    drop_table :topics
  end
end

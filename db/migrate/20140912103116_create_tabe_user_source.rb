class CreateTabeUserSource < ActiveRecord::Migration
  def up
    create_table :user_sources do |t|
      t.string :name
    end
  end

  def down
    drop_table :user_sources
  end
end

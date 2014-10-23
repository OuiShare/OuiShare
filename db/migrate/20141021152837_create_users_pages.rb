class CreateUsersPages < ActiveRecord::Migration
  def up
    create_table :users_pages do |t|
      t.string :title
      t.text :text
      t.string :link_text
      t.references :language, index: true

      t.timestamps
    end
  end
  def down
    drop_table :users_pages
  end
end

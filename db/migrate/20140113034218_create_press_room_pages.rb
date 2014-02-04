class CreatePressRoomPages < ActiveRecord::Migration
  def change
    create_table :press_room_pages do |t|
      t.references :language, index: true
      t.text :main_text
      t.string :image
      t.string :title1
      t.string :text1
      t.string :title2
      t.text :text2
      t.string :title3
      t.string :text3

      t.timestamps
    end
  end
end

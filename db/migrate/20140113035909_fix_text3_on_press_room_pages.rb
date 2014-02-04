class FixText3OnPressRoomPages < ActiveRecord::Migration
  def up
    change_column :press_room_pages, :text3, :text
    change_column :press_room_pages, :text1, :text
  end

  def down
    change_column :press_room_pages, :text1, :string
    change_column :press_room_pages, :text3, :string
  end
end

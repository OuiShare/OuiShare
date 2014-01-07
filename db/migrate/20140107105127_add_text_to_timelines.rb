class AddTextToTimelines < ActiveRecord::Migration
  def change
    add_column :timelines, :text, :text
  end
end

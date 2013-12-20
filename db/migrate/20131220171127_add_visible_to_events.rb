class AddVisibleToEvents < ActiveRecord::Migration
  def change
    add_column :events, :visible, :boolean, default: true, null: false
  end
end

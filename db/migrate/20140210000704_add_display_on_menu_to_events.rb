class AddDisplayOnMenuToEvents < ActiveRecord::Migration
  def change
    add_column :events, :display_on_menu, :boolean, null: false, default: true
  end
end

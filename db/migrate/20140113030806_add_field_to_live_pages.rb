class AddFieldToLivePages < ActiveRecord::Migration
  def change
    add_column :live_pages, :text2, :text
  end
end

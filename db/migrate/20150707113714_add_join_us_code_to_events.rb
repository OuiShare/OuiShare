class AddJoinUsCodeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :join_us_code_html, :text
  end
end

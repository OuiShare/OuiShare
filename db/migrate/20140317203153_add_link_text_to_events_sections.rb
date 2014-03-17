class AddLinkTextToEventsSections < ActiveRecord::Migration
  def change
    add_column :events_sections, :link_text, :string
  end
end

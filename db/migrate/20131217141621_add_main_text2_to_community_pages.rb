class AddMainText2ToCommunityPages < ActiveRecord::Migration
  def change
    add_column :community_pages, :main_text2, :text
  end
end

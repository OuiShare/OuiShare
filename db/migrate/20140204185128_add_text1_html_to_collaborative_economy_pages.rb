class AddText1HtmlToCollaborativeEconomyPages < ActiveRecord::Migration
  def change
    add_column :collaborative_economy_pages, :text1_html, :text
  end
end

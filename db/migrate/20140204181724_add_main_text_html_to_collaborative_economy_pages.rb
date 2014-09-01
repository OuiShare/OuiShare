class AddMainTextHtmlToCollaborativeEconomyPages < ActiveRecord::Migration
  def change
    add_column :collaborative_economy_pages, :main_text_html, :text
  end
end

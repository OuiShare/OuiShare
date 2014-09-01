class AddFieldsToCollaborativeEconomyPage < ActiveRecord::Migration
  def change
    add_column :collaborative_economy_pages, :text5, :text
    add_column :collaborative_economy_pages, :title5, :string
    add_column :collaborative_economy_pages, :text5_html, :string
  end
end

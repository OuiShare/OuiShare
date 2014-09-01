class ChangeCollaborativeEconomyPagesText5ToText < ActiveRecord::Migration
  def up
    change_column :collaborative_economy_pages, :text5, :text
    change_column :collaborative_economy_pages, :text5_html, :text
  end

  def down
    change_column :collaborative_economy_pages, :text5, :string
    change_column :collaborative_economy_pages, :text5_html, :string
  end
end

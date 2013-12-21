class AddLinksToPartners < ActiveRecord::Migration
  def change
    add_column :partners, :link1, :string
    add_column :partners, :link2, :string
    add_column :partners, :link3, :string
    add_column :partners, :link4, :string
    add_column :partners, :link5, :string
    add_column :partners, :link6, :string
    add_column :partners, :link7, :string
  end
end

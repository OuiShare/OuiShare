class AddSlugToCommunity < ActiveRecord::Migration
  def change
    add_column :communities, :slug, :string
    add_index :communities, :slug, unique: true
  end
end

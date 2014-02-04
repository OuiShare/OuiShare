class AddSlugToEvent < ActiveRecord::Migration
  def change
    add_column :events, :slug, :string
    add_index :events, :slug
  end
end

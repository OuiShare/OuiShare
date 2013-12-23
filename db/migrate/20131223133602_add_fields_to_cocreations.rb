class AddFieldsToCocreations < ActiveRecord::Migration
  def change
    add_column :cocreations, :name, :string
    add_column :cocreations, :link, :string
  end
end

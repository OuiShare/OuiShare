class AddImageToCocreations < ActiveRecord::Migration
  def change
    add_column :cocreations, :image, :string
  end
end

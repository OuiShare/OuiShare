class AddHomeImageToEvents < ActiveRecord::Migration
  def change
    add_column :events, :home_image, :string
  end
end

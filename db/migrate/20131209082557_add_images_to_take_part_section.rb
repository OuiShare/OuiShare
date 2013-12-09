class AddImagesToTakePartSection < ActiveRecord::Migration
  def change
    add_column :take_part_sections, :image1, :string
    add_column :take_part_sections, :image2, :string
    add_column :take_part_sections, :image3, :string
  end
end

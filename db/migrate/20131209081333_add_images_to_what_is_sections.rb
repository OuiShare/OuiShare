class AddImagesToWhatIsSections < ActiveRecord::Migration
  def change
    add_column :what_is_sections, :image1, :string
    add_column :what_is_sections, :image2, :string
    add_column :what_is_sections, :image3, :string
    add_column :what_is_sections, :image4, :string
  end
end

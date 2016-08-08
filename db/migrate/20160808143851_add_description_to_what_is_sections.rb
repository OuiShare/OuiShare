class AddDescriptionToWhatIsSections < ActiveRecord::Migration
  def change
  	add_column :what_is_sections, :description, :text
  	add_column :what_is_sections, :link1, :string
  	add_column :what_is_sections, :link2, :string
  	add_column :what_is_sections, :link3, :string
  	add_column :what_is_sections, :link4, :string
  end
end

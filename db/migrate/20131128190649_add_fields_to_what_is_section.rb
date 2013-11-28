class AddFieldsToWhatIsSection < ActiveRecord::Migration
  def change
    add_column :what_is_sections, :title1, :string
    add_column :what_is_sections, :title2, :string
    add_column :what_is_sections, :title3, :string
    add_column :what_is_sections, :title4, :string
  end
end

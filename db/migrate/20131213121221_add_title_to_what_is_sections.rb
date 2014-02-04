class AddTitleToWhatIsSections < ActiveRecord::Migration
  def change
    add_column :what_is_sections, :title, :string
  end
end

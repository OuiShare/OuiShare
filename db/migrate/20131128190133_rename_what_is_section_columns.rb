class RenameWhatIsSectionColumns < ActiveRecord::Migration
  def change
    rename_column :what_is_sections, :mission, :text1
    rename_column :what_is_sections, :values, :text2
    rename_column :what_is_sections, :history, :text3
    rename_column :what_is_sections, :past_projects, :text4
  end
end

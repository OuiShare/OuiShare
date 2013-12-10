class RenameLinkOnTakePartSections < ActiveRecord::Migration
  def change
    rename_column :take_part_sections, :link_1, :link1
  end
end

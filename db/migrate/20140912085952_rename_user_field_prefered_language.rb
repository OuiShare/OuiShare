class RenameUserFieldPreferedLanguage < ActiveRecord::Migration
  def change
    rename_column :users, :prefered_language_id, :language_id
  end
end

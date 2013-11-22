class AddVisibleToLanguages < ActiveRecord::Migration
  def change
    add_column :languages, :visible, :boolean, null: :false, default: false
  end
end

class CreateHotProjectsSections < ActiveRecord::Migration
  def change
    create_table :hot_projects_sections do |t|
      t.string :title
      t.text :text
      t.string :link_text
      t.references :language

      t.timestamps
    end
  end
end

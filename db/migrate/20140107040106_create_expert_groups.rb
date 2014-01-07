class CreateExpertGroups < ActiveRecord::Migration
  def change
    create_table :expert_groups do |t|
      t.string :name
      t.text :text
      t.string :link
      t.references :language, index: true

      t.timestamps
    end
  end
end

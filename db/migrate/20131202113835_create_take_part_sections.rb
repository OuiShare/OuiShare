class CreateTakePartSections < ActiveRecord::Migration
  def change
    create_table :take_part_sections do |t|
      t.string :main_title
      t.text :main_text
      t.text :link_text
      t.string :title1
      t.text :text1
      t.string :link_1
      t.string :title2
      t.text :text2
      t.string :link2
      t.string :title3
      t.text :text3
      t.string :link3
      t.references :language, index: true

      t.timestamps
    end
  end
end

class CreateAbouts < ActiveRecord::Migration
  def change
    create_table :abouts do |t|
      t.string :main_title
      t.text :main_text1
      t.text :main_text2
      t.string :image
      t.string :title1
      t.text :text1
      t.string :title2
      t.text :text2
      t.string :title3
      t.text :text3
      t.string :title4
      t.text :text4
      t.references :language, index: true

      t.timestamps
    end
  end
end

class CreateRegistrationPages < ActiveRecord::Migration
  def change
    create_table :registration_pages do |t|
      t.string :main_title
      t.text :main_text
      t.text :main_text2
      t.string :link1
      t.string :image1
      t.string :title1
      t.text :text1
      t.string :image2
      t.string :title2
      t.text :text2
      t.text :text3
      t.string :link2

      t.timestamps
    end
  end
end

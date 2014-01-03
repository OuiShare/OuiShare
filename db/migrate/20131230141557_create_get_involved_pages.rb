class CreateGetInvolvedPages < ActiveRecord::Migration
  def change
    create_table :get_involved_pages do |t|
      t.text :main_text
      t.string :image
      t.string :title1
      t.text :text1
      t.string :link1
      t.string :link1_text
      t.string :title2
      t.text :text2
      t.string :link2
      t.string :link2_text
      t.string :title3
      t.text :text3
      t.string :link3
      t.string :link3_text
      t.string :title4
      t.text :text4
      t.string :link4
      t.string :link4_text
      t.string :title5
      t.text :text5
      t.string :link5
      t.string :link5_text
      t.string :title6
      t.text :text6
      t.string :link6
      t.string :link6_text
      t.string :title7
      t.text :text7
      t.string :link7
      t.string :link7_text
      t.references :language, index: true

      t.timestamps
    end
  end
end

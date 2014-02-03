class CreateCollaborativeEconomyPages < ActiveRecord::Migration
  def change
    create_table :collaborative_economy_pages do |t|
      t.references :language, index: true
      t.text :main_text
      t.string :image
      t.string :title1
      t.text :text1
      t.string :title2
      t.text :text2
      t.string :title3
      t.text :text3
      t.string :title4
      t.text :text4

      t.timestamps
    end
  end
end

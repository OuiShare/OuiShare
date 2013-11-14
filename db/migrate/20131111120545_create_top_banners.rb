class CreateTopBanners < ActiveRecord::Migration
  def change
    create_table :top_banners do |t|
      t.string :title1
      t.text :text1
      t.string :title2
      t.string :text2
      t.references :language, index: true

      t.timestamps
    end
  end
end

class CreateDonationPages < ActiveRecord::Migration
  def change
    create_table :donation_pages do |t|
      t.string :main_title
      t.text :main_text
      t.string :thanks_text
      t.string :image1
      t.string :title1
      t.text :text1
      t.string :image2
      t.string :title2
      t.text :text2

      t.timestamps
    end
  end
end

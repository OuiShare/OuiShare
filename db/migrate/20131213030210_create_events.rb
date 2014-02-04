class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :place
      t.date :date
      t.time :time
      t.text :resume
      t.text :info
      t.text :join_us_text
      t.string :service1_image
      t.string :service1_link
      t.string :service1_title
      t.string :service2_image
      t.string :service2_link
      t.string :service2_title
      t.string :service3_image
      t.string :service3_link
      t.string :service3_title
      t.string :title1
      t.text :text1
      t.string :title2
      t.text :text2
      t.references :language, index: true

      t.timestamps
    end
  end
end

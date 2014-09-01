class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.references :language, index: true
      t.string :user_picture1
      t.string :author1
      t.string :call_to_action1
      t.text :text1
      t.string :user_picture2
      t.string :author2
      t.string :call_to_action2
      t.text :text2
      t.string :user_picture3
      t.string :author3
      t.string :call_to_action3
      t.text :text3
      t.string :user_picture4
      t.string :author4
      t.string :call_to_action4
      t.text :text4

      t.timestamps
    end
  end
end

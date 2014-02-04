class CreateResearches < ActiveRecord::Migration
  def change
    create_table :researches do |t|
      t.references :language, index: true
      t.string :title
      t.text :text
      t.string :image
      t.string :link

      t.timestamps
    end
  end
end

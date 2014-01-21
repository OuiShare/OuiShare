class CreateWorkusPages < ActiveRecord::Migration
  def change
    create_table :workus_pages do |t|
      t.references :language, index: true
      t.text :text
      t.string :image

      t.timestamps
    end
  end
end

class CreateValuePage < ActiveRecord::Migration
  def change
    create_table :value_pages do |t|
      t.text :text
      t.string :image
      t.references :language, index: true
    end
  end
end

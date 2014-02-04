class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.references :language, index: true
      t.string :name
      t.text :text
      t.string :image
      t.string :link

      t.timestamps
    end
  end
end

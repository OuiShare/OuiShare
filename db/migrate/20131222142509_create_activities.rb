class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.text :text
      t.string :link
      t.string :image
      t.references :language, index: true

      t.timestamps
    end
  end
end

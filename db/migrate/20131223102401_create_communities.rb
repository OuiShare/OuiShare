class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.string :name
      t.text :text
      t.string :link
      t.references :language, index: true

      t.timestamps
    end
  end
end

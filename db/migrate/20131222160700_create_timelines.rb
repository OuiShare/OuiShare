class CreateTimelines < ActiveRecord::Migration
  def change
    create_table :timelines do |t|
      t.string :url
      t.references :language, index: true

      t.timestamps
    end
  end
end

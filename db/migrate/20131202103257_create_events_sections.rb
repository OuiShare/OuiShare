class CreateEventsSections < ActiveRecord::Migration
  def change
    create_table :events_sections do |t|
      t.string :title
      t.text :text
      t.references :language, index: true

      t.timestamps
    end
  end
end

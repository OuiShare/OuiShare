class CreateCocreations < ActiveRecord::Migration
  def change
    create_table :cocreations do |t|
      t.text :text
      t.references :language, index: true

      t.timestamps
    end
  end
end

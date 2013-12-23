class CreateValues < ActiveRecord::Migration
  def change
    create_table :values do |t|
      t.string :name
      t.string :link
      t.text :text
      t.references :language
    end
  end
end

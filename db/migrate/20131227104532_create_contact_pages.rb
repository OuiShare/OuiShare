class CreateContactPages < ActiveRecord::Migration
  def change
    create_table :contact_pages do |t|
      t.string :title
      t.text :text
      t.references :language, index: true

      t.timestamps
    end
  end
end

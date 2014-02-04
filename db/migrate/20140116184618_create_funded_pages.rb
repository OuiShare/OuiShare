class CreateFundedPages < ActiveRecord::Migration
  def change
    create_table :funded_pages do |t|
      t.references :language, index: true
      t.text :main_text
      t.string :image

      t.timestamps
    end
  end
end

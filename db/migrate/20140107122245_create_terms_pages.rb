class CreateTermsPages < ActiveRecord::Migration
  def change
    create_table :terms_pages do |t|
      t.text :text
      t.references :language, index: true

      t.timestamps
    end
  end
end

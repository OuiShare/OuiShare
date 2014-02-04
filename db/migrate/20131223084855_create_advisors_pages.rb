class CreateAdvisorsPages < ActiveRecord::Migration
  def change
    create_table :advisors_pages do |t|
      t.string :title
      t.text :text
      t.text :link_text
      t.references :language, index: true

      t.timestamps
    end
  end
end

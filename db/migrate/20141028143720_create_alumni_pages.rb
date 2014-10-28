class CreateAlumniPages < ActiveRecord::Migration
  def change
    create_table :alumni_pages do |t|
	  t.string :title
	  t.text :text
	  t.string :link_text
	  t.references :language, index: true

	  t.timestamps
    end
  end
end

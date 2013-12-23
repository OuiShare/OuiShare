class CreateTeamPages < ActiveRecord::Migration
  def change
    create_table :team_pages do |t|
      t.string :title
      t.text :text
      t.string :link_text
      t.references :language, index: true

      t.timestamps
    end
  end
end

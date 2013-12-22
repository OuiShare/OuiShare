class CreateGovernancePages < ActiveRecord::Migration
  def change
    create_table :governance_pages do |t|
      t.text :text
      t.string :image
      t.references :language, index: true

      t.timestamps
    end
  end
end

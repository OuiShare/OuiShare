class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :partner1
      t.string :partner2
      t.string :partner3
      t.string :partner4
      t.string :partner5
      t.string :partner6
      t.string :partner7
      t.references :language

      t.timestamps
    end
  end
end

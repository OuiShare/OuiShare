class CreateWhatIsSections < ActiveRecord::Migration
  def change
    create_table :what_is_sections do |t|
      t.text :mission
      t.text :values
      t.text :history
      t.text :past_projects
      t.references :language, index: true

      t.timestamps
    end
  end
end

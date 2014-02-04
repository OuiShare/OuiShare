class CreateFundingInfos < ActiveRecord::Migration
  def change
    create_table :funding_infos do |t|
      t.references :language, index: true
      t.string :title
      t.text :text
      t.string :image

      t.timestamps
    end
  end
end

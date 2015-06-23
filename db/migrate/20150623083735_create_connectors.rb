class CreateConnectors < ActiveRecord::Migration
  def change
    create_table :connectors do |t|
      t.belongs_to :users, index: true
      t.belongs_to :community, index: true
    end
  end
end

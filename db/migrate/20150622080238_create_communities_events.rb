class CreateCommunitiesEvents < ActiveRecord::Migration
  def change
    create_table :communities_events do |t|
      t.belongs_to :community, index: true
      t.belongs_to :event, index: true
    end
  end
end
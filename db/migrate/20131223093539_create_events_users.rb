class CreateEventsUsers < ActiveRecord::Migration
  def change
    create_table :events_users do |t|
      t.references :event, index: true
      t.references :user, index: true
    end
  end
end

class CreateCommunitiesUsers < ActiveRecord::Migration
  def change
    create_table :communities_users do |t|
      t.references :community, index: true
      t.references :user, index: true
    end
  end
end

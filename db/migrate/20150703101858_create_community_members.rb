class CreateCommunityMembers < ActiveRecord::Migration
  def change
    create_table :community_members do |t|
    	t.belongs_to :user, index: true
    	t.belongs_to :community, index: true
      t.timestamps
    end
  end
end

class CreateJoinTableUserTopic < ActiveRecord::Migration
  def up
    create_join_table :users, :topics do |t|
      t.index [:user_id, :topic_id]
      t.index [:topic_id, :user_id]
    end
  end
  def down
    drop_table :users_topics
  end
end

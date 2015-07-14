class DeleteEventJoinUsField < ActiveRecord::Migration
  def change
  	remove_column :events, :join_us
  end
end

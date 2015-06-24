class AddJoinUsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :join_us, :string
  end
end

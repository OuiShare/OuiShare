class AddRegionsToCommunities < ActiveRecord::Migration
  def change
    add_column :communities, :region_id, :integer
  end
end

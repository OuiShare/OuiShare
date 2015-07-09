class AddLatitudeAndLongitudeToCommunities < ActiveRecord::Migration
  def change
  	add_column :communities, :latitude, :float
    add_column :communities, :longitude, :float
  end
end

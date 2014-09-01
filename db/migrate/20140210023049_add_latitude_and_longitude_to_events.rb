class AddLatitudeAndLongitudeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :latitude, :float
    add_column :events, :longitude, :float
  end
end

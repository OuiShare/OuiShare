class AddMainImageToCommunities < ActiveRecord::Migration
  def change
  	add_column :communities, :main_image, :string
  end
end

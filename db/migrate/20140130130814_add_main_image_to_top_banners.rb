class AddMainImageToTopBanners < ActiveRecord::Migration
  def change
    add_column :top_banners, :main_image, :string
  end
end

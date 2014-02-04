class AddImagesToTopBanners < ActiveRecord::Migration
  def change
    add_column :top_banners, :image1, :string
    add_column :top_banners, :link1, :string
    add_column :top_banners, :image2, :string
    add_column :top_banners, :link2, :string
  end
end

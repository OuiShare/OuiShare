class AddBannersToTopBanners < ActiveRecord::Migration
  def change
    add_column :top_banners, :title3, :string
    add_column :top_banners, :text3, :text
    add_column :top_banners, :image3, :string
    add_column :top_banners, :link3, :string
    add_column :top_banners, :link_text3, :string

    add_column :top_banners, :title4, :string
    add_column :top_banners, :text4, :text
    add_column :top_banners, :image4, :string
    add_column :top_banners, :link4, :string
    add_column :top_banners, :link_text4, :string

    add_column :top_banners, :title5, :string
    add_column :top_banners, :text5, :text
    add_column :top_banners, :image5, :string
    add_column :top_banners, :link5, :string
    add_column :top_banners, :link_text5, :string
  end
end

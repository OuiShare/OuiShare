class AddVisibleCheckboxesToTopBanners < ActiveRecord::Migration
  def change
  	add_column :top_banners, :visible1, :boolean, null: false, default: true
  	add_column :top_banners, :visible2, :boolean, null: false, default: true
  	add_column :top_banners, :visible3, :boolean, null: false, default: true
  	add_column :top_banners, :visible4, :boolean, null: false, default: true
  	add_column :top_banners, :visible5, :boolean, null: false, default: true
  end
end

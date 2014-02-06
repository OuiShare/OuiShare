class AddFieldsToTopBanner < ActiveRecord::Migration
  def change
    add_column :top_banners, :link_text1, :string
    add_column :top_banners, :link_text2, :string
  end
end

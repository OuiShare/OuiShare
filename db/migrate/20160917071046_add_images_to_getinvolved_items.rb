class AddImagesToGetinvolvedItems < ActiveRecord::Migration
  def change
  	add_column :get_involved_pages, :image1, :string
  	add_column :get_involved_pages, :image2, :string
  	add_column :get_involved_pages, :image3, :string
  	add_column :get_involved_pages, :image4, :string
  	add_column :get_involved_pages, :image5, :string
  	add_column :get_involved_pages, :image6, :string
  	add_column :get_involved_pages, :image7, :string
  end
end

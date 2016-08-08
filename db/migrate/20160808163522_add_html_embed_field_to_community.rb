class AddHtmlEmbedFieldToCommunity < ActiveRecord::Migration
  def change
  	add_column :communities, :embed_code_html, :text
  end
end

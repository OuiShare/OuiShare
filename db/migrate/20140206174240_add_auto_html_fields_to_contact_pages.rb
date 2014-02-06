class AddAutoHtmlFieldsToContactPages < ActiveRecord::Migration
  def change
    add_column :contact_pages, :text_html, :text
  end
end

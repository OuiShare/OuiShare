class AddAutoHtmlFieldsToFaqPages < ActiveRecord::Migration
  def change
    add_column :faq_pages, :text_html, :text
  end
end

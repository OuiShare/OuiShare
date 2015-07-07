class AddContactLanguagesToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :contact_languages, :text, array: true, default: '{}'
  end
end

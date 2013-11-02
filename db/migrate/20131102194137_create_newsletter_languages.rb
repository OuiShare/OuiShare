class CreateNewsletterLanguages < ActiveRecord::Migration
  def change
    create_table :newsletter_languages do |t|
      t.string :language
      t.string :mailchimp_id
    end
  end
end

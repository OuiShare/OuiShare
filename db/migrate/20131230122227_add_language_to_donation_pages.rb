class AddLanguageToDonationPages < ActiveRecord::Migration
  def change
    add_reference :donation_pages, :language, index: true
  end
end

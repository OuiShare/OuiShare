class AddLanguageToRegistrationPages < ActiveRecord::Migration
  def change
    add_reference :registration_pages, :language, index: true
  end
end

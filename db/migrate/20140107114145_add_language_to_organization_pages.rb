class AddLanguageToOrganizationPages < ActiveRecord::Migration
  def change
    add_reference :organization_pages, :language, index: true
  end
end

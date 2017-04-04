require "spec_helper"
require "support/factories"

RSpec.feature "Admin user dashboard", :type => :feature do
  let(:current_language) { create(:language) }
  let(:admin) {create(:admin)}

  scenario "Admin deletes a user in users list" do
    p current_language
    visit "/en/users/sign_in"
    fill_in "user_email", :with => admin.email
    fill_in "user_password", :with => admin.password
    click_button "SIGN IN"

    visit "/en/admin/users"

    save_and_open_page
    click_link "Delete"

    page.driver.browser.switch_to.alert.accept
    expect(page).to have_text("User was successfully destroyed.")
  end
end
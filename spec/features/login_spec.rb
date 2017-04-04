require "spec_helper"
require "support/factories"

RSpec.feature "Login", :type => :feature do
  let(:current_language) { create(:language) }
  let(:admin) {create(:admin)}

  scenario "Log in as admin" do
    p current_language
    visit "/en/users/sign_in"
    fill_in "user_email", :with => admin.email
    fill_in "user_password", :with => admin.password
    click_button "SIGN IN"
    expect(page).to have_current_path(admin_home_path)
  end

end
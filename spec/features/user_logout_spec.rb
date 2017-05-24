require 'rails_helper'

RSpec.describe "The User Logs Out", type: :feature do
  context "as a registered user" do
    it "logged in user can logout" do
      user = User.create(username: "sarah", password: "password")

      visit login_path

      fill_in "Username", with: user.username
      fill_in "Password", with: "password"
      click_button "Login"

      assert page.has_content?("Welcome sarah")

      click_link "Logout"

      refute page.has_content?("Welcome sarah")
    end
  end
end

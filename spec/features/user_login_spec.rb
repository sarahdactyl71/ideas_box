require 'rails_helper'

RSpec.describe "The User Logins", type: :feature do
  context "as a registered user" do
    it "registered user can log in" do
      user = User.create(username: "sarah", password: "password")

      visit login_path

      fill_in "Username", with: user.username
      fill_in "Password", with: "password"
      click_button "Login"

      assert page.has_content?("Welcome sarah")
    end
  end
end

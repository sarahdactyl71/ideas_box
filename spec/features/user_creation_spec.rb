require 'rails_helper'

RSpec.describe "UserCreations", type: :feature do
  describe "GET /user_creations" do
    it "a user can be created" do
      visit new_user_path

      fill_in "Username", with: "Sarah"
      fill_in "Password", with: "password"
      click_button "Create Account"

      assert page.has_content?("Welcome Sarah")
    end
  end
end

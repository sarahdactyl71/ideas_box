require 'rails_helper'

RSpec.describe "user can make ideas", type: :feature do
  context "as a registered user" do
    it "registered user can generate a new idea" do
      user = User.create(username: "sarah", password: "password")
      category = Category.create(name: "Travel")
      title = "Start Kickboxing"
      description = "Kickbox cause I don't want eyebrows anymore"

      visit new_idea_path

      fill_in "Title", with: title
      fill_in "Description", with: description
      select "Travel", from: "idea[category_id]"

      click_button "Create Idea"

      expect(page).to have_current_path(ideas_path)
      assert page.has_content?("Start Kickboxing")
      assert page.has_content?("Kickbox cause I don't want eyebrows anymore")
    end
  end
end

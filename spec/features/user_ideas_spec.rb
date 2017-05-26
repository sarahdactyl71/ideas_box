require 'rails_helper'

RSpec.describe "user can make ideas", type: :feature do
  context "as a registered user" do
    it "registered user can generate a new idea" do
      user = User.create(username: "tom", password: "password")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      category = Category.create(name: "Travel")
      title = "Do Stuff"
      description = "Do More Stuff"
      visit new_user_idea_path(user)

      fill_in "Title", with: title
      fill_in "Description", with: description
      select "Travel", from: "idea[category_id]"

      click_button "Create Idea"

      expect(current_path).to eq(user_ideas_path(user))
      expect(page).to have_content("Do Stuff")
      expect(page).to have_content("Do More Stuff")
    end
  end
end

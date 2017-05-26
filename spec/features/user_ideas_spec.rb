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

  context "as a registered user" do
    it "registered user can delete an idea" do
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

      click_on "Delete"

      expect(current_path).to eq(user_ideas_path(user))
      expect(page).to_not have_content("Do Stuff")
      expect(page).to_not have_content("Do More Stuff")

    end
  end

  context "as a registered user" do
    it "registered user can edit an idea" do
      user = User.create(username: "tom", password: "password")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      category = Category.create(name: "Travel")
      idea = Idea.create(title: "Do Stuff", description: "Do some stuff", category_id: category.id, user_id: user.id)

      visit edit_user_idea_path(user, idea)

      fill_in "Title", with: "I like turtles"
      fill_in "Description", with: "who doesn't love turtles"
      select "Travel", from: "idea[category_id]"

      click_button "Edit Idea"

      expect(current_path).to eq(user_ideas_path(user))
      expect(page).to have_content("I like turtles")
      expect(page).to have_content("who doesn't love turtles")

    end
  end

end

require 'rails_helper'

describe Category do
  it "category can be created" do
    category = Category.create(name: "Travel")

    expect(category).to be_valid
  end

  it "is not valid without a name" do
    category = Category.create(name: nil)

    expect(category).to_not be_valid
  end
end

class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Categories.all
  end
end

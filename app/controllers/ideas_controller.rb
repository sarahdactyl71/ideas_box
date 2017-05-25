class IdeasController < ApplicationController
  before_action :set_user, only: [:index, :new, :create]

  def index
    @user = current_user
    @ideas = Idea.all
  end

  def new
    @categories = Category.all
    @user = current_user
    @idea = Idea.new()
  end

  def create
    @categories = Category.all
    @user = current_user
    @idea = @user.ideas.new(idea_params)
    if @idea.save
      flash[:success] = "#{@idea.title} added"
      redirect_to user_ideas_path(@user)
    else
      # render :new
    end
  end

  def show
    @user = current_user
    @ideas = Idea.find(params[:id])
  end

  private

  def set_user
    @user = current_user
  end

  def idea_params
    params.require(:idea).permit(:title, :description, :category_id)
  end

end

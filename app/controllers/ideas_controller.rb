class IdeasController < ApplicationController
  before_action :set_user, only: [:index, :new, :create, :destroy]

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
      render :new
    end
  end

  def edit
    @categories = Category.all
    @user = current_user
    @idea = Idea.find(params[:id])
  end

  def update
    @categories = Category.all
    @user = current_user
    @idea = Idea.find(params[:id])
    @idea.update(idea_params)
    if @idea.save
      flash[:success] = "#{@idea.title} updated!"
      redirect_to user_ideas_path(@user)
    else
      render :edit
    end
  end

  def show
    @user = current_user
    @ideas = Idea.find(params[:id])
  end

  def destroy
    @user = current_user
    @idea = Idea.find(params[:id])
    @idea.destroy

    flash[:success] = "#{@idea.title} was successfully deleted!"
    redirect_to user_ideas_path(@user)
  end

  private

  def set_user
    @user = current_user
  end

  def idea_params
    params.require(:idea).permit(:title, :description, :category_id)
  end

end

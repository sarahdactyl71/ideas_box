class IdeasController < ApplicationController
  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      flash[:success] = "#{@idea.title} added"
      redirect_to ideas_path
    else
      render :new
    end
  end

  def show
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description)
  end
end

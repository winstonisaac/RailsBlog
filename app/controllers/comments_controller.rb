class CommentsController < ApplicationController
  before_action :get_story
  def index
    @comments = @story.comments
  end

  def new
    @comment = @story.comments.build
  end

  def create
    @comment = @story.comments.build(comment_params)
    if @comment.save
      redirect_to story_path(params[:story_id])
    else
      render :new
    end
  end

  def edit
    @comment = @story.comments.find(params[:id])
  end

  def show
    redirect_to story_path(params[:story_id])
  end

  def update
    @comment = @story.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to story_path(params[:story_id])
    else
      render :edit
    end
  end

  def destroy
    @comment = @story.comments.find(params[:id])
    @comment.destroy

    redirect_to story_path(params[:story_id])
  end

  private

  def get_story
    @story = Story.find(params[:story_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :story_id)
  end
end
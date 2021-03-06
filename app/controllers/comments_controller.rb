class CommentsController < ApplicationController

  before_action :authenticate_user

  def index
    @comments = Comment.all
    render json: @comments
  end

  def show
    @comment = Comment.find(params[:id])
    render json: @comment
  end

  def create
    @comment = Comment.find_or_create_by(comment_params)

    if @comment.save
      render json: @comment
    else
      render json: {error: @comment.errors.full_messages}, status: 422
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: {error: @comment.errors.full_messages}, status: 422
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :page_id, :message, :visibility)
  end

end

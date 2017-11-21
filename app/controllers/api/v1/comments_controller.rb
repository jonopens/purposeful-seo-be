class Api::V1::CommentsController < ApplicationController

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

  private

  def comment_params
    params.require(:comment).permit()
  end

end
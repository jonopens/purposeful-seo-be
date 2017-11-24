class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.find_or_create_by(user_params)

    if @user.save
      render json: @user
    else
      render json: {error: @user.errors.full_messages}, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password_digest, :crawl_credits)
  end

end
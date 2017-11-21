class API::V1::PagesController < ApplicationController

  def index
    @pages = Page.all
    render json: @pages
  end

  def show
    @page = Page.find(params[:id])
    render json: @page
  end

  def create
    @site = Page.find_or_create_by(page_params)

    if @page.save
      render json: @page
    else
      render json: {error: @page.errors.full_messages}, status: 422
    end
  end	

  private

  def page_params
  	params.require(:page).permit(:base_url, :page_count, :user_id)
  end


end
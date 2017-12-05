class PagesController < ApplicationController

  before_action :authenticate_user

  def index
    @pages = Page.all
    render json: @pages
  end

  def show
    @page = Page.find(params[:id])
    render json: @page
  end

  def create
    @page = Page.find_or_create_by(page_params)
    if @page.save
      render json: @page
    else
      render json: {error: @page.errors.full_messages}, status: 422
    end
  end	

  def destroy
    @page = Page.find(params[:id])
    render json: @page
    @page.destroy
  end

  private

  def page_params
  	params.require(:page).permit(
      :site_id, 
      :page_path, 
      :page_insight_status, 
      :text_to_html_ratio, 
      :word_count, 
      :title, 
      :meta_desc, 
      :h1, 
      :h2, 
      :last_crawled
    )
  end
end
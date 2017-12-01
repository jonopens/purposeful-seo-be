class Api::V1::PagesController < ApplicationController

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
    Crawl.create(page_id: @page.id)
    if @page.save
      render json: @page
    else
      render json: {error: @page.errors.full_messages}, status: 422
    end
  end	

  def update
    # when I make a page hidden or recrawl the same page
    # I want to update the correct record
    # and eventually update insights

    @page = Page.find(params[:id])
    if @page.update(page_params)
      puts "YAY"
      render json: @page
    else
      puts "UH OH"
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
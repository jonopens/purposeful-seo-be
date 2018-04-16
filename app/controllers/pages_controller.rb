class PagesController < ApplicationController

  before_action :authenticate_user

  def index
    @pages = Page.all
    render json: @pages
  end

  def show
    @page = Page.find(params[:id])
    page_with_insights = {
      id: @page.id,
      site_id: @page.site_id,
      page_path: @page.page_path,
      page_insight_status: @page.page_insight_status,
      text_to_html_ratio: @page.text_to_html_ratio,
      word_count: @page.word_count,
      title: @page.title,
      meta_desc: @page.meta_desc,
      h1: @page.h1,
      h2: @page.h2,
      last_crawled: @page.last_crawled,
      error_on_last_crawl: @page.error_on_last_crawl,
      redirect_on_last_crawl: @page.redirect_on_last_crawl,
      body_text: @page.body_text,
      insights: @page.insights
    }
    render json: page_with_insights
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

  def crawl
    @page = Page.find(params[:id])
    scraper = Scraper.new(@page)
    scraper.scrape_and_respond
    if scraper.status_code == 200
      ig = InsightGenerator.new(@page)
      ig.generate_insights
      render json: @page
    else
      render json: {error: @page.errors.full_messages}, status: 422
    end
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

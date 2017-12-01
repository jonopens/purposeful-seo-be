class Api::V1::CrawlsController < ApplicationController

  def index
    @crawls = Crawl.all
    render json: @crawls
  end

  def show
    @crawl = Crawl.find(params[:id])
    render json: @crawl
  end

  def update
    @crawl = Crawl.find(params[:id])
    @crawl.crawl_and_respond
    if @crawl.save
      render json: @crawl.page
    else
      render json: {error: @crawl.errors.full_messages}, status: 422
    end
  end

end
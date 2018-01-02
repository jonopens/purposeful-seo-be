class CrawlsController < ApplicationController

  def index
    @crawls = Crawl.all
    render json: @crawls
  end

  def show
    @crawl = Crawl.find(params[:id])
    render json: @crawl
  end

  def create
    
    @crawl = Crawl.new(page_id: params[:page_id])
    if @crawl.save
      @crawl.crawl_and_respond
      if @crawl.status_code == 200
        insight_generator = InsightGenerator.new(@crawl)
        insight_generator.generate_insights
        render json: @crawl.page
      else
        render json: @crawl.page
      end
    else
      render json: {error: @crawl.errors.full_messages}, status: 422
    end
  end

end
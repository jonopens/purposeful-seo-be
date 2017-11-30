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
    @crawl = Crawl.(params[:id])

    if @crawl.save
      render json: @crawl
    else
      render json: {error: @crawl.errors.full_messages}, status: 422
    end
  end

  # private

  # def crawl_params
  #   params.require(:crawl).permit()
  # end

end
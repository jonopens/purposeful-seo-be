class Api::V1::SitesController < ApplicationController

  def index
    @sites = Site.all
    render json: @sites
  end

  def show
    @site = Site.find(params[:id])
    render json: @site
  end

  def create
    @site = Site.find_or_create_by(site_params)

    if @site.save
      render json: @site
    else
      render json: {error: @site.errors.full_messages}, status: 422
    end
  end	

  private

  def site_params
  	params.require(:site).permit(:base_url, :page_count, :user_id)
  end


end
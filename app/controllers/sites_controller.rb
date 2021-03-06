class SitesController < ApplicationController

  before_action :authenticate_user

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

  def destroy
    @site = Site.find(params[:id])
    render json: @site
    @site.destroy
  end

  private

  def site_params
  	params.require(:site).permit(
      :full_url, 
      :domain_name, 
      :protocol,  
      :user_id
    )
  end


end
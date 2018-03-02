class InsightsController < ApplicationController

  before_action :authenticate_user

  def index
    @insights = Insight.all
    render json: @insights
  end

  def show
    @insight = Insight.find(params[:id])
    render json: @insight
  end

  def create
    @insight = Insight.find_or_create_by(insight_params)

    if @insight.save
      render json: @insight
    else
      render json: {error: @insight.errors.full_messages}, status: 422
    end
  end

  def update
    @insight = Insight.find(params[:id])
    byebug
  end

  private

  def insight_params
    params.require(:insight).permit(
      :crawl_id,
      :page_id,
      :optimization_type,
      :content,
      :completion_status
    )
  end

end

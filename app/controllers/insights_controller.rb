class InsightsController < ApplicationController

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
    @insight = Insight.find_(params[:id]) 
       
  end

  private

  def insight_params
    params.require(:insight).permit()
  end

end
class KeytermsController < ApplicationController

  def index
    @keyterms = Keyterm.all
    render json: @keyterms
  end

  def show
    @keyterm = Keyterm.find(params[:id])
    render json: @keyterm
  end

  def create
    @keyterm = Keyterm.find_or_create_by(insight_params)

    if @keyterm.save
      render json: @keyterm
    else
      render json: {error: @keyterm.errors.full_messages}, status: 422
    end
  end

  def update
    @keyterm = Keyterm.find_(params[:id]) 
       
  end

  private

  def insight_params
    params.require(:keyterm).permit()
  end

end
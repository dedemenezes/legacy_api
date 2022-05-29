class Api::V1::WandsController < ApplicationController
  def index
    @wands = Wand.all

    render json: @wands.to_json, status: 200
  end

  def show
    @wand = Wand.find(params[:id])

    render json: @wand.to_json, status: 200
  end
end

class Api::V1::CharactersController < ApplicationController

  def index
    @characters = Character.all

    render json: @characters.to_json, status: 200
  end
end

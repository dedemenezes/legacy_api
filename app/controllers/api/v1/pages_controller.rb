class Api::V1::PagesController < ApplicationController
  def main
    @resources = {
      books: "https://legacy--api.herokuapp.com/api/v1/books",
      characters: "https://legacy--api.herokuapp.com/api/v1/characters",
      wands: "https://legacy--api.herokuapp.com/api/v1/wands",
      species: "https://legacy--api.herokuapp.com/api/v1/species",
      houses: "https://legacy--api.herokuapp.com/api/v1/houses",
      members: "https://legacy--api.herokuapp.com/api/v1/members"
    }.to_json

    render json: @resources, status: 200
  end
end

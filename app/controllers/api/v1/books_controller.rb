class Api::V1::BooksController < ApplicationController
  def index
    @books = Book.all
    binding.pry
    render json: @books.to_json, status: 200
  end
end

class Api::V1::BooksController < ApplicationController
  def index
    @books = Book.all
    return render json: { message: 'Still no books to display' }, status: 204 if @books.empty?

    render json: @books.to_json, status: 200
  end

  def show
    @book = Book.find(params[:id])
    return render json: { message: 'Still no books to display' }, status: 204 if @book.nil?

    render json: @book.to_json, status: 200
  end
end

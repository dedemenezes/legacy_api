# frozen_string_literal: true

module Api
  module V1
    class BooksController < ApplicationController
      def index
        @books = Book.all
        # return render json: { message: 'Still no books to display' }, status: 204 if @books.empty?
        if @books.empty?
          render json: @books.to_json, status: :no_content
        else
          render json: @books.to_json, status: 200
        end
      end

      def show
        @book = Book.find(params[:id])

        render json: @book.to_json, status: 200
      end
    end
  end
end

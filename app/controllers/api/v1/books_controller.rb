# frozen_string_literal: true

module Api
  module V1
    class BooksController < ApplicationController
      def index
        raise NoRecordsFoundError if Book.count.zero?

        @books = Book.all

        # return render json: { message: 'Still no books to display' }, status: 204 if @books.empty?
      end

      def show
        @book = Book.find(params[:id])
      end
    end
  end
end

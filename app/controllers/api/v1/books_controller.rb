# frozen_string_literal: true

module Api
  module V1
    class BooksController < ApplicationController
      def index
        raise NoRecordsFoundError if Book.count.zero?

        @books = Book.includes(book_artists: :artist).all
      end

      def show
        @book = Book.includes(book_artists: :artist).find(params[:id])
      end
    end
  end
end

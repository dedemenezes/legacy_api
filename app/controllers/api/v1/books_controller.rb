# frozen_string_literal: true

module Api
  module V1
    class BooksController < ApplicationController
      def index
        raise NoRecordsFoundError if Book.count.zero?

        @books = Book.includes(book_artists: :artist).all
      end

      def show
        @book = if params[:id] =~ /^\d/
                  Book.includes(book_artists: :artist).find(params[:id])
                else
                  Book.includes(book_artists: :artist).find_by_name(params[:id].capitalize)
                end
      end
    end
  end
end

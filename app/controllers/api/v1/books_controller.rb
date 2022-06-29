# frozen_string_literal: true

module Api
  module V1
    class BooksController < ApplicationController
      def index
        @books = Book.includes(:book_artists, :artists).all
      end

      def show
        @book = Book.includes(:artists).find(params[:id])
      end
    end
  end
end

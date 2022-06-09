# frozen_string_literal: true

module Api
  module V1
    class CharactersController < ApplicationController
      def index
        @characters = Character.all

        if @characters.empty?
          render json: { message: "Sorry, there's nothing for your" }, status: 204
        else
          render json: @characters.to_json, status: 200
        end
      end

      def show
        @character = Character.find(params[:id])

        render json: @character.to_json, status: 200
      end
    end
  end
end

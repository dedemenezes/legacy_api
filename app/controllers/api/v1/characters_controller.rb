# frozen_string_literal: true

module Api
  module V1
    class CharactersController < ApplicationController
      def index
        @characters = Character.all
      end

      def show
        @character = Character.includes(:wand_as_master, :wands_as_owner).find(params[:id])
      end
    end
  end
end

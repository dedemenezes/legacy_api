# frozen_string_literal: true

module Api
  module V1
    class CharactersController < ApplicationController
      def index
        @pagy, @records = pagy(Character.all)
        render :index, { data: @records }
      end

      def show
        @character = Character.includes(:wand_as_master, :wands_as_owner).find(params[:id])
      end
    end
  end
end

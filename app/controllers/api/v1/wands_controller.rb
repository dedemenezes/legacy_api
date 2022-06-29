# frozen_string_literal: true

module Api
  module V1
    class WandsController < ActionController::Base
      # add_views_paths
      def index
        @wands = Wand.all
        # render json: @wands.to_json, status: 200
      end

      def show
        @wand = Wand.find(params[:id])

        render json: @wand.to_json, status: 200
      end
    end
  end
end

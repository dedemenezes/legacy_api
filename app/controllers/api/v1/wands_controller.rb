# frozen_string_literal: true

module Api
  module V1
    class WandsController < ApplicationController
      # add_views_paths
      def index
        @pagy, @records = pagy(Wand.all)
        render :index, { data: @records }
        # render json: @wands.to_json, status: 200
      end

      def show
        @wand = Wand.includes(:wand_master, :wand_owners, :master, :owners).find(params[:id])
      end
    end
  end
end

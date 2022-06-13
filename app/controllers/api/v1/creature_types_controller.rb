# frozen_string_literal: true

module Api
  module V1
    class CreatureTypesController < ApplicationController

      def index
        @creature_types = CreatureType.joins(:related_as_main).all
      end

      def show
        @creature_type = CreatureType.find(params[:id])

        render :show, status: 200
      end
    end
  end
end

# frozen_string_literal: true

module Api
  module V1
    class CreatureTypesController < ApplicationController
      def index
        @creature_types = CreatureType.includes(:related_as_main).all
      end

      def show
        @creature_type = CreatureType.includes(:related_as_main, :relateds).find(params[:id])
      end
    end
  end
end

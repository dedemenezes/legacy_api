# frozen_string_literal: true

module Api
  module V1
    class CreatureTypesController < ApplicationController
      append_view_path "#{Rails.root}/app/views"

      def index
        @creature_types = CreatureType.all
        render json: @creature_types.to_json, status: 200
      end

      def show
        @creature_type = CreatureType.find(params[:id])

        render json: @creature_type.to_json, status: 200
      end
    end
  end
end

# frozen_string_literal: true

module Api
  module V1
    class CreatureTypesController < ApplicationController
      def index
        @creature_types = CreatureType.all
        @pagy, @records = pagy(@creature_types)
        render :index, { data: @records }
      end

      def show
        @creature_type = CreatureType.includes(related_as_main: :related).find(params[:id])
      end
    end
  end
end

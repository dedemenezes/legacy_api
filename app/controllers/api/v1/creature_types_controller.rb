# frozen_string_literal: true

module Api
  module V1
    class CreatureTypesController < ApplicationController
      def index
        # @creature_types = CreatureType.includes(:related_as_main)
        @creature_types = CreatureType.joins(:related_as_main)
                                      .select('creature_types.*', 'COUNT("main_id") AS related_as_main_count')
                                      .group('creature_types.id')
        @pagy, @records = pagy(@creature_types)
        render :index, { data: @records }
      end

      def show
        @creature_type = CreatureType.includes(related_as_main: :related).find(params[:id])
      end
    end
  end
end

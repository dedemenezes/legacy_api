# frozen_string_literal: true

module Api
  module V1
    class HousesController < ApplicationController
      def index
        @houses = House.order(:id)
      end

      def show
        @house = if params[:id] =~ /^\d/
                   House.includes(heads: :header).find(params[:id])
                 else
                   House.includes(heads: :header).find_by_name(params[:id].capitalize)
                 end
      end
    end
  end
end

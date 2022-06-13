# frozen_string_literal: true

module Api
  module V1
    class HousesController < ApplicationController
      def index
        @houses = House.all.order(:id)
      end

      def show
        @house = House.find(params[:id])
      end
    end
  end
end

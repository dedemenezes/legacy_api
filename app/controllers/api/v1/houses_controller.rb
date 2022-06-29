# frozen_string_literal: true

module Api
  module V1
    class HousesController < ApplicationController
      def index
        @houses = House.includes(:members).order(:id)
      end

      def show
        @house = House.find_by_name(params[:name].capitalize)
      end
    end
  end
end

# frozen_string_literal: true

module Api
  module V1
    class HousesController < ApplicationController
      def index
        @houses = House.order(:id)
      end

      def show
        @house = House.includes(:characters, :headers, :distinctions).find_by_name(params[:name].capitalize)
      end
    end
  end
end

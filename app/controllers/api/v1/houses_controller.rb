# frozen_string_literal: true

module Api
  module V1
    class HousesController < ApplicationController
      def index
        @houses = House.order(:id)
      end

      def show

        @house =  if params[:name] =~ /^\d/
                    House.includes(heads: :header).find(params[:name])
                  else
                    House.includes(heads: :header).find_by_name(params[:name].capitalize)
                  end
      end
    end
  end
end

# frozen_string_literal: true

module Api
  module V1
    class MembersController < ApplicationController
      def index
        @house = House.find_by_name(params[:house_name].capitalize)
        @members = Member.includes(:character).where(house: @house)
      end
    end
  end
end

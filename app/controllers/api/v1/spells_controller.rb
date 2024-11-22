# frozen_string_literal: true

module Api
  module V1
    class SpellsController < ApplicationController
      def index
        @pagy, @records = pagy(Spell.all)
        render :index, { data: @records }
      end

      def show
        @spell = Spell.find(params[:id])
      end
    end
  end
end

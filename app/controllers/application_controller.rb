# frozen_string_literal: true

class ApplicationController < ActionController::API
  class NoRecordsFoundError < StandardError
    def message
      'No records found in the database'
    end
  end

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from NoRecordsFoundError, with: :no_records

  private

  def no_records(exception)
    render json: { error: exception.message }, status: :no_content
    # render json: { message: "Sorry, there's nothing for your" }, status: 204
  end

  def not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end
end

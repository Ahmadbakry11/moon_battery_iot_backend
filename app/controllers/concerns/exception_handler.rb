# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ error: { message: e.message } }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ error: { message: e.message } }, :unprocessable_entity)
    end

    rescue_from Pundit::NotAuthorizedError do |e|
      json_response({ error: { message: 'Access Forbidden' } }, :forbidden)
    end

    rescue_from ActiveRecord::ConnectionNotEstablished, with: :database_unavailable
    rescue_from PG::ConnectionBad, with: :database_unavailable
  end

  private

  def database_unavailable
    render json: { error: { message: 'Database server is currently unavailable. Please try again later.' } }, status: :service_unavailable
  end
end

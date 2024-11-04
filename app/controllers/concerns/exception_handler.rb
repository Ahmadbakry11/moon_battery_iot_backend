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
  end
end

# frozen_string_literal: true

module ResponseHandler
  extend ActiveSupport::Concern

  included do
    def json_response(record, status = :ok)
      render json: record, status: status
    end

    def json_unauthorized_response
      render json: { error: { mesage: 'unauthorized battery' } }, status: :unauthorized
    end
  end
end

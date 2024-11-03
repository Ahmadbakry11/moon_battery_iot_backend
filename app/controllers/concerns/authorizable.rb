# frozen_string_literal: true

module Authorizable
  extend ActiveSupport::Concern

  included do
    def authenticate_battery!
      json_unauthorized_response and return unless access_token
      
      @current_battery = MoonBattery.find_by(auth_token: access_token)
      json_unauthorized_response and return unless @current_battery

      @current_battery
    end

    private

    def access_token
      token = request.headers['Authorization']
      return if token.blank?
      token
    end
  end
end

# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ResponseHandler
  include ExceptionHandler
  include Authorizable
  include Pundit::Authorization

  after_action :verify_authorized

  attr_reader :current_battery

  def pundit_user
    current_battery
  end
end

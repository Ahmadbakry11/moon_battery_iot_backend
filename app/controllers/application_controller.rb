# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ResponseHandler
  include ExceptionHandler
  include Authorizable
end

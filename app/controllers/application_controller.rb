class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  include SessionsHelper

  def initialize
    super
    @app_name = Rails.configuration.app_name
  end
  
end

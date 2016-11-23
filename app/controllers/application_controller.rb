class ApplicationController < ActionController::Base
  before_action :authenticate_fan!

  protect_from_forgery with: :exception
end

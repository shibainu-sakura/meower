class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # 1 user authentification #
  before_action :authenticate_user!
end

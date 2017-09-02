class PagesController < ApplicationController
  # 4 #
  skip_before_action :authenticate_user!
  # #
  def feed
  end
end

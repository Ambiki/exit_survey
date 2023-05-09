class ApplicationController < ActionController::Base
  class UnauthorizedError < StandardError; end

  private

  def current_user
    @current_user ||= User.last
  end

  def authenticate_user!
    raise UnauthorizedError unless current_user
  end
end

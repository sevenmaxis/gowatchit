class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :convert_params

  private

  def convert_params
    params = HashWithIndifferentAccess.new(params)
  end
end

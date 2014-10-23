# Application Controller
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  # add_flash_types :success, :info, :warning, :danger
  private
    def redirect_to_back_or_default(default = root_url, *args)
      if request.env['HTTP_REFERER'].present? && request.env['HTTP_REFERER'] != request.env['REQUEST_URI']
        redirect_to :back, *args
      else
        redirect_to default, *args
      end
    end

end

# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  before_filter :set_user
  helper :all # include all helpers, all the time
  protect_from_forgery 
		include SessionsHelper
# See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

	def set_user
		@user = User.find(session[:id]) if @user.nil? && session[:id]
  end


end

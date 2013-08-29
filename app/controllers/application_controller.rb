class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
    # Make logged_in? available in templates as a helper
    helper_method :logged_in?, :admin?

    # Returns the currently logged in user or nil if there isn't one
    def current_user
      return unless session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end

    # Make current_user available in templates as a helper
    helper_method :current_user

    # Filter method to enforce a login requirement
    # Apply as a before_filter on any controller you want to protect
    def authenticate
      logged_in? ? true : access_denied
    end

    # Predicate method to test for a logged in user
    def logged_in?
      current_user.is_a? User
    end

    def access_denied
      redirect_to login_path, :notice =>t('sessions.login_message') and return false
    end

    def admin?
      current_user.profile.roles.each do |r|
        if r.admin_role
          return true
        end
      end

      return false
    end
end

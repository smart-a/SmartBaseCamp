class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def require_user
        if !logged_in?
            redirect_to '/', notice: "Please login to perform this action"
        end
    end

    def require_same_user
        if (current_user[:id].to_s != params[:id].to_s) && (current_user[:id].to_s != params[:user_id].to_s)
            redirect_to '/', notice: "You can only do this on your account"
            # redirect_back fallback_location: root_path, notice: "You can only do this on your account"
        end
    end

    
    
end

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
            redirect_to user_path(current_user[:id]), notice: "You can only do this on your account"
        end
    end

    def require_project_owner(project)
        if (project[:user_id].to_s != current_user[:id].to_s)
            redirect_to user_projects_path(current_user[:id]), notice: "You can only do this on your project"
        end
    end

    def require_project_member(project,project_user)
        if (project[:user_id] != current_user[:id] && current_user[:id] != project_user[:user_id])
            redirect_to user_projects_path(current_user[:id]), notice: "You can only do this on your collaboration project"
        end
    end

    def require_thread_owner(thread)
        if (current_user[:id] != thread[:user_id])
            redirect_to user_project_path(current_user[:id]), notice: "You can only do this on your thread"
        end
    end

    def require_message_owner(message)
        if (current_user[:id] != message[:user_id])
            redirect_to user_project_path(current_user[:id]), notice: "You can only do this on your messgae"
        end
    end

    
    
end

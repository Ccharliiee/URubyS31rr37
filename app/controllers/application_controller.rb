class ApplicationController < ActionController::Base

    helper_method :current_user, :loggedin
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def loggedin
        !!current_user
    end

    def require_user
        if !loggedin
            # flash[:alert] = "Please log in to proceed"
            redirect_to root_path
        end
    end
end

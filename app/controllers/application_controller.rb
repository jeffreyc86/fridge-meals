class ApplicationController < ActionController::Base

    def logged_in_user
        @current_user = User.find_by(id: session[:user_id])
    end
    
    
end

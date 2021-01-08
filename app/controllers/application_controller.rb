class ApplicationController < ActionController::Base

    
    before_action :authorized?, except: :home
    before_action :logged_in_user

    def authorized?
        redirect_to new_user_path unless logged_in_user
    end

    def logged_in_user
        @current_user = User.find_by(id: session[:user_id])
    end
    
    
end

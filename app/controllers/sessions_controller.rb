class SessionsController < ApplicationController


    def logout
        session.delete(:user_id)
        redirect_to login_path
    end

end

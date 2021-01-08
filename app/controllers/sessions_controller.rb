class SessionsController < ApplicationController


    def destroy
        session.delete(:user_id)
        redirect_to home_path
    end

    def home
    end

end

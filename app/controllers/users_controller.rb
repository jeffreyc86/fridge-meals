class UsersController < ApplicationController

    skip_before_action :authorized?, only: [:new, :create, :login, :handle_login]
    

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    
    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
            if @user.valid?
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                flash[:errors] = @user.errors.full_messages
                redirect_to edit_user_path(@user)
            end
    end

    def destroy
        @user = User.find(params[:id])
        session.delete(:user_id)
        @user.destroy
        redirect_to home_path
    end

    def create
        @user = User.create(user_params)
            if @user.valid?
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                flash[:errors] = @user.errors.full_messages
                redirect_to new_user_path
            end
    end

    #edit/update method to update account info, delete account

    def login
    end

    def handle_login
        @user = User.find_by(username: params[:username])
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                flash[:error] = "Wrong Username or Password"
                redirect_to login_path
            end
    end


    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :password)
    end

end

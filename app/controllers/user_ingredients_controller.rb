class UserIngredientsController < ApplicationController

    def create
        UserIngredient.create(user_id: params[:user_id], ingredient_id: params[:ingredient_id], amount: params[:amount], unit: params[:unit])
        redirect_to user_path(@current_user)
    end

    def destroy
        @user_ingredient = UserIngredient.find(params[:id])
        @user_ingredient.destroy
        redirect_to user_path(@current_user)
    end


end


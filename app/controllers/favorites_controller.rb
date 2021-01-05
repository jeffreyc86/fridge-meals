class FavoritesController < ApplicationController

    def create
        Favorite.create(user_id: @current_user.id, recipe_id: params[:recipe_id])
        redirect_to recipe_path(params[:recipe_id])
    end

    def destroy
        @favorite = Favorite.find(params[:id])
        @favorite.destroy
        redirect_to recipe_path(params[:recipe])
    end



end

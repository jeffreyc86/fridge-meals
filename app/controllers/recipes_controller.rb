class RecipesController < ApplicationController

    def index 
        @recipes = Recipe.all
    end

    def show
        @recipe = Recipe.find(params[:id])
    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.create(recipe_params)
        if @recipe.valid?
            redirect_to recipe_path(@recipe)
        else
                flash[:errors] = @recipe.errors.full_messages
                redirect_to new_recipe_path
        end
    end

    private

    def recipe_params
        params.require(:recipe).permit(:user_id, :name, :image_url, :vegetarian, :dish_type, :difficulty, :servings, :summary, :instructions, :time)
    end

end

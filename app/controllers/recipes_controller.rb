class RecipesController < ApplicationController

    def index 
        @recipes = Recipe.all
        @dish_types = Recipe.all.map { |recipe| recipe.dish_type }.uniq.sort
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

    def results
        @recipes = Recipe.all

        if params[:difficulty] != ""
            @recipes = @recipes.select { |recipe| recipe.difficulty == params[:difficulty]}
        end 

        if params[:vegetarian] != ""
            @recipes = @recipes.select { |recipe| recipe.vegetarian == params[:vegetarian]}
        end 

        if params[:dish_type] != ""
            @recipes = @recipes.select { |recipe| recipe.dish_type == params[:dish_type]}
        end 

        if params[:time] != ""
            num = params[:time].split("..").map{ |num| num.to_i }
            @recipes = @recipes.select { |recipe| recipe.time.between?(num[0],num[1])}
        end

        @recipes
      
    end

    private

    def recipe_params
        params.require(:recipe).permit(:user_id, :name, :image_url, :vegetarian, :dish_type, :difficulty, :servings, :summary, :instructions, :time)
    end

end

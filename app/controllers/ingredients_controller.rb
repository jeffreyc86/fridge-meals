class IngredientsController < ApplicationController

    def index
        @ingredients = Ingredient.all
        @categories = Ingredient.all.map { |ing| ing.category }.uniq.sort
    end

    def show
        @ingredient = Ingredient.find(params[:id])
        @units = RecipeIngredient.all.map { |ri| ri.unit }.uniq.sort
    end

    def results
        @ingredients = Ingredient.where("name LIKE ?", "%#{params[:answer]}%")
    end

    def cat_results
        @category = params[:category]
        @ingredients = Ingredient.where(category: @category)
    end

end

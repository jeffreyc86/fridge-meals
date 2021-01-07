class IngredientsController < ApplicationController

    def index
        @ingredients = Ingredient.all
    end

    def show
        @ingredient = Ingredient.find(params[:id])
        @units = RecipeIngredient.all.map { |ri| ri.unit }.uniq.sort
    end

    def results
        @ingredients = Ingredient.where("name LIKE ?", "%#{params[:answer]}%")
    end

end

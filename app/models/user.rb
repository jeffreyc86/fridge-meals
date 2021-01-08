class User < ApplicationRecord

    has_many :user_ingredients
    has_many :ingredients, through: :user_ingredients
    has_many :favorites
    has_many :favorite_recipes, through: :favorites, source: :recipe

    has_secure_password

    validates :first_name, :last_name, :username, :password, presence: true
    validates :first_name, format: { with: /\A([a-zA-Z]|-){2,30}\Z/, message: "only allows letters or hyphens."}
    validates :last_name, format: { with: /\A([a-zA-Z]|-){2,30}\Z/, message: "only allows letters or hyphens."}
    validates :username, uniqueness: true
    validates :username, format: { with: /\A\w{6,30}\Z/, message: "allows 6-30 characters - using only letters, numbers, and underscores(_)."}
    validates :password, format: { with: /\A\S{5,15}\Z/, message: "allows 5-15 characters."}

    def full_name
        "#{first_name} #{last_name}"
    end
    
    def rec_m_ing
        ui_arr = user_ingredients.map { |ui| ui.ingredient_id }
        Recipe.all.map do |recipe|
            {recipe.id => (recipe.recipe_ingredients.map { |ri| ri.ingredient_id } - ui_arr).count}
        end.inject(:merge)
    end

    def missing_ing(recipe)
        ui_arr = user_ingredients.map { |ui| ui.ingredient_id }
        (recipe.recipe_ingredients.map { |ri| ri.ingredient_id } - ui_arr).count
    end

    #iterate through Recipes to get seperate arrays of recipeingredients
        #match each array of recipeingredients less array of useringredients
        #array of missing recipeingredients, which we can count 
    #array of missing recipeingredients
    # def few_ing_needed #1-4 ing needed
    # end

    # def many_ing_needed #5+ ing needed
    # end

end

class Recipe < ApplicationRecord

    belongs_to :user, optional: true
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    has_many :favorites
    has_many :favorite_users, through: :favorites, foreign_key: :user_id

    def author
        if self.user
            self.user.full_name
        else
            "Anonymous"
        end
    end

    def is_vegetarian
        if vegetarian == true
            "Yes"
        else
            "No"
        end
    end

end

class User

    @@all = []

    attr_accessor :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all 
        @@all
    end

    def recipes
        my_recipes = RecipeCard.all.select do | recipeCard |
            recipeCard.user == self
        end
        my_recipes.map do | recipeCard |
            recipeCard.recipe
        end
    end

    def add_recipe_card(recipe, rating, date)
        RecipeCard.new(self, recipe, rating, date)
    end

    def declare_allergen(ingredient)
        Allergen.new(self, ingredient)
    end

    def allergens
        my_allergens = Allergen.all.select do |allergen|
            allergen.user == self
        end
        my_allergens.map do |allergen|
            allergen.ingredient
        end
    end

    def top_three_recipes
        my_recipes = RecipeCard.all.select do | recipeCard |
            recipeCard.user == self
        end
        my_recipes.sort_by{|recipe| recipe.rating}.reverse[0..2].map{|recipeins| recipeins.recipe}

    end

    def most_recent_recipe
        my_recipes = RecipeCard.all.select do | recipeCard |
            recipeCard.user == self
        end
        my_recipes.sort_by{|recipe| recipe.date}.reverse[0]
    end

    def safe_recipes
        safe_array = []
        my_recipes = RecipeCard.all.select do | recipeCard |
            recipeCard.user == self
        end
        array_of_recipes = my_recipes.map do | recipecard |
            recipecard.recipe
        end
        array_of_recipes.each do | recipe |
            if recipe.allergens = nil
                safe_array << recipe
            end
        end
        safe_array
    end

end
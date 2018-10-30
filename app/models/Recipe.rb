class Recipe

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def recipe_count
        array = RecipeCard.all.select do |recipeCard|
            recipeCard.recipe == self
        end
        array.length
    end

    def self.most_popular
        most_quant = 0
        most_pop_recipe = nil
        @@all.each do |recipe|
            if recipe.recipe_count > most_quant
                most_quant = recipe.recipe_count
                most_pop_recipe = recipe
            end
        end
        most_pop_recipe
    end

    def users
        my_recipes = RecipeCard.all.select do | recipeCard |
            recipeCard.recipe == self 
        end
        my_recipes.map do | recipeCard |
            recipeCard.user
        end
    end

    def ingredients
        my_recipes = RecipeIngredient.all.select do | recipeIng |
            recipeIng.recipe == self 
        end
        my_recipes.map do | recipeIng |
            recipeIng.ingredient
        end
    end

    # def allergens how does this relate to user?
    #     self.ingredients.each do |the_ingredient|
    #       Allergen.all.select do | allergen |
    #         allergen.ingredient == the_ingredient
    #       end
    #     end
    # end

    def add_ingredients(array) #[salt, pepper, paprika]
        array.each do |ingredient|
            RecipeIngredient.new(ingredient, self)
        end
    end

end
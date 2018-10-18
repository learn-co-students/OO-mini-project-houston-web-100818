class User
  attr_accessor :name
  @@all = []

  def initialize(name)
    self.name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipes
    # should return all of the recipes this user has recipe cards for
    RecipeCard.all.map do | recipe_card |
      if recipe_card.user == self
        recipe_card.recipe
      end
    end.compact
  end

  def add_recipe_card(recipe, date, rating)
    # should accept a recipe instance as an argument, as well as a date and rating, and create a new recipe card for this user and the given recipe
      RecipeCard.new(self, recipe, date, rating)
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    Allergen.all.map do | allergen |
      if allergen.user == self
        allergen.ingredient
      end
    end.compact
  end

  def top_three_recipes
    # return an array of recipe instances
    user_cards = RecipeCard.all.select do | recipe_card |
      recipe_card.user == self
    end

    sorted_recipes = user_cards.sort_by do | recipe_card |
      recipe_card.rating
    end

    top_three_cards = sorted_recipes.reverse[0..2]
    top_three_cards.map do | card |
      card.recipe
    end
  end

  def most_recent_recipe
    # should return the recipe most recently added to the user's cookbook.
    user_cards = RecipeCard.all.select do | recipe_card |
      recipe_card.user == self
    end

    sorted_recipes = user_cards.sort_by do | recipe_card |
      recipe_card.date
    end

    sorted_recipes.reverse[0].recipe
  end

  def safe_recipes
    # should return all recipes that do not contain ingredients the user is allergic to
    safe_dishes = []
    Recipe.all.each do | recipe |
      is_safe = true
      recipe.ingredients.each do | ingredient |
        self.allergens.each do | allergen |
          if allergen == ingredient
            is_safe = false
          end
        end
      end
      if is_safe
          # binding.pry
          safe_dishes << recipe
      end
    end
    safe_dishes
  end

  def best_safe_recipe
    user_cards = RecipeCard.all.select do | recipe_card |
      recipe_card.user == self
    end

    sorted_recipes = user_cards.sort_by do | recipe_card |
      recipe_card.rating
    end
    best_safe_recipe = "No Safe Recipes!"
    sorted_recipes.each do | recipe |
      binding.pry
      if self.safe_recipes.include?(recipe)
        best_safe_recipe = recipe
      end
    end
    best_safe_recipe
  end

end

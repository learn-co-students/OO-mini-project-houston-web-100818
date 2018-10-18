class Recipe
  attr_accessor :name
  @@all = []

  def initialize(name)
    self.name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
    # should return the recipe instance with the highest number of users (the recipe that has the most recipe cards)
    high_count = 0
    recipe_with_most = nil

    Recipe.all.each do | recipe |
      # check how many recipe cards it appears on
      instance_count = 0
      RecipeCard.all.each do | card |
        if card.recipe == recipe
          instance_count += 1
        end
      end
      if instance_count > high_count
        high_count = instance_count
        recipe_with_most = recipe
      end
    end
    recipe_with_most
  end

  def users
    # should return the user instances who have recipe cards with this recipe
    RecipeCard.all.map do | recipe_card |
      if recipe_card.recipe == self
        recipe_card.user
      end
    end.compact
  end

  def ingredients
    # should return all of the ingredients in this recipe
    RecipeIngredient.all.map do | recipe_ingredient |
      if recipe_ingredient.recipe == self
        recipe_ingredient.ingredient
      end
    end.compact
  end

  def allergens
    # should return all of the ingredients in this recipe that are allergens
    allergen_ingredients = []
    self.ingredients.each do | ingredient |
      Allergen.all.each do | allergen |
        if allergen.ingredient == ingredient
          allergen_ingredients << ingredient
        end
      end
    end
    allergen_ingredients
  end


  def add_ingredients(ingredient_array)
    #should take an array of ingredient instances as an argument, and associate each of those ingredients with this recipe
    ingredient_array.each do | ingredient |
      RecipeIngredient.new(self, ingredient)
    end
  end
end

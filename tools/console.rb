require_relative '../config/environment.rb'
require 'pry'

chicken_soup = Recipe.new("Chicken Soup")
recipe2 = Recipe.new("Recipe2")
recipe3 = Recipe.new("Recipe3")
recipe4 = Recipe.new("Recipe4")
recipe5 = Recipe.new("Recipe5")

salt = Ingredient.new("Salt")
tequila = Ingredient.new("Tequila")
water = Ingredient.new("Water")

chicken_soup.add_ingredients([salt, tequila, water])

janet = User.new("Janet")
janet.add_recipe_card(chicken_soup, 5, 10052018)
janet.add_recipe_card(recipe2, 4, 10102017)
janet.add_recipe_card(recipe3, 2, 11122018)
janet.add_recipe_card(recipe4, 3, 10102016)

janet.declare_allergen(salt)

teeesting = RecipeIngredient.new(salt, recipe2)
another_test = RecipeCard.new(janet, recipe5, 4, 10102010)
#tester = RecipeCard.new(janet, chicken_soup, 5, 10102020)

#TO DO janet.most_recent_recipe => recipe3

binding.pry
0
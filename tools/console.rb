require_relative '../config/environment.rb'

# TEST CODE
lasagna = Recipe.new("lasagna")
pizza = Recipe.new('pizza')
pot_roast = Recipe.new('pot roast')
sandwich = Recipe.new('reuben')

eddie = User.new("Eddie")
rob = User.new("Robert")
karen =  User.new("Karen")

eddies_pot_roast = eddie.add_recipe_card(pot_roast, 20181001, 9)
robs_pizza = rob.add_recipe_card(pizza, 20181010, 8.5)
karens_pot_roast = karen.add_recipe_card(pot_roast, 20181012, 7)
robs_lasagna = rob.add_recipe_card(lasagna, 20181004, 10)
robs_pot_roast = rob.add_recipe_card(pot_roast, 20181017, 4)
robs_sandwich = rob.add_recipe_card(sandwich, 20180931, 12)

cheese = Ingredient.new("cheese")
beef = Ingredient.new("beef")
noodles = Ingredient.new("noodles")
sauce = Ingredient.new("tomato sauce")
pastrami = Ingredient.new("pastrami")
sauerkraut = Ingredient.new("sauerkraut")

lasagna_ingredients = lasagna.add_ingredients([cheese, noodles, sauce, beef])
pizza_ingredients = pizza.add_ingredients([cheese, sauce])
pot_roast_ingredients = pot_roast.add_ingredients([beef, sauce])
sandwich_ingredients = sandwich.add_ingredients([pastrami, sauerkraut])

karen_allergen1 = karen.declare_allergen(beef)
karen_allergen2 = karen.declare_allergen(cheese)
robs_allergen1 = rob.declare_allergen(noodles)
karen_allergen3 = karen.declare_allergen(pastrami)
eddie_allergen1 = eddie.declare_allergen(pastrami)

binding.pry

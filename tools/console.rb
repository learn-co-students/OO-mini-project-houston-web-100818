require_relative '../config/environment.rb'

bob = User.new("bob")
gumbo = Recipe.new("gumbo")
etoufe = Recipe.new ("etoufe")
opelousas = Recipe.new("opelousas")
jambalaya = Recipe.new("jambalaya")
alice = User.new("alice")
peanut = Ingredient.new("peanut")
dairy = Ingredient.new("dairy")
rice = Ingredient.new("rice")
alice.declare_allergen(peanut)
bob.declare_allergen(peanut)
bob.declare_allergen(dairy)
gumbo.add_ingredients([peanut, dairy, rice])


bob.add_recipe_card(gumbo, "today", 9)
bob.add_recipe_card(etoufe, "yesterday", 6)
bob.add_recipe_card(opelousas, "tomorrow?", 10)
bob.add_recipe_card(jambalaya, "last week", 7)
alice.add_recipe_card(opelousas, "today", 8)

binding.pry

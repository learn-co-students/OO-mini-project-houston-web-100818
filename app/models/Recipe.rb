class Recipe 
attr_accessor :name
@@all = []

def initialize(name)
  self.name = name
  self.class.all << self
end

def self.all 
  @@all
end

def recipe_card
  RecipeCard.all.select {|u| u.recipe == self}
end

def self.most_popular
  most_popular = nil
  most_popular_num = 0
  
  self.all.each do |r|
      if r.recipe_card.length > most_popular_num
        most_popular = r
        most_popular_num = r.recipe_card.length
      end
  end 
  most_popular
end

def users
 x =  RecipeCard.all.select {|u| u.recipe == self}
 x.collect {|i| i.user }
end

def ingredients
  var = RecipeIngredient.all.select do |a|
    a.recipe == self
  end
  var.collect {|i| i.ingredient}
end

def add_ingredients(ingredients_array)
  ingredients_array.each do |ingredient|
    RecipeIngredient.new(self, ingredient)
  end   
end

def allergens
  al = Allergen.all.collect do |a|
    a.ingredient
  end 
  al & self.ingredients
end

end
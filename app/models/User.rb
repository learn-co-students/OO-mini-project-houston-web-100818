require 'pry'
class User 
  @@all = []
  attr_accessor :allergens, :name

  def initialize(name)
    self.name = name
    self.class.all << self
  end

  def self.all 
    @@all
  end

  def recipes
    r = RecipeCard.all.select {|r| r.user == self}
    r.collect{|i| i.recipe}
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(recipe, self, date, rating)
  end 

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    a =Allergen.all.select {|a| a.user == self}
    a.collect{|i| i.ingredient}
  end

  def top_three_recipes 
      top3 = self.recipes.sort_by {|i| i.rating}.reverse!
      top3.slice(0..2)
  end

  def most_recent_recipe
    self.recipes.last
  end 
  
  # def safe_recipes
    
  #   rec.reject{|r| r.ingredient }
  # end 

end
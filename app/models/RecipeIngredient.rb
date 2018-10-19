class RecipeIngredient 
  @@all = []
  attr_accessor :ingredient, :recipe
  
  def initialize(recipe, ingredient)
    self.recipe = recipe
    self.ingredient = ingredient
    self.class.all << self
  end

  def self.all 
    @@all
  end


end
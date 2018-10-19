class RecipeCard 
  @@all = []
  attr_accessor :date, :rating, :user, :recipe

  def initialize(recipe, user, date, rating)
    self.recipe = recipe
    self.user = user
    self.date = date 
    self.rating = rating
    self.class.all << self
  end

  def self.all 
    @@all
  end

end
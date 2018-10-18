class RecipeCard
  attr_accessor :user, :recipe, :date, :rating
  @@all = []

  def initialize(user, recipe, date, rating)
    self.user = user
    self.recipe = recipe
    self.date = date
    self.rating = rating
    @@all << self
  end

  def self.all
    @@all
  end
end

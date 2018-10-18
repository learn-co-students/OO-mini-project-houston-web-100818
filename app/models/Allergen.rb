class Allergen
  attr_accessor :user, :ingredient
  @@all = []

  def initialize(user, ingredient)
    self.user =  user
    self.ingredient =  ingredient
    @@all << self
  end

  def self.all
    @@all
  end
end

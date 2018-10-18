class Ingredient
  attr_accessor :name
  @@all = []

  def initialize(name)
    self.name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    high_count = 0
    ingredient_with_most = nil

    Ingredient.all.each do | ingredient |
      # check how many allergen instances it appears on
      instance_count = 0
      Allergen.all.each do | allergen |
        if allergen.ingredient == ingredient
          instance_count += 1
        end
      end
      if instance_count > high_count
        high_count = instance_count
        ingredient_with_most = ingredient
      end
    end
    ingredient_with_most
  end
end

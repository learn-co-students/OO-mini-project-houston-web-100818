class Ingredient 
  @@all = []
  attr_accessor :name

  def initialize(name) 
    self.name = name
    self.class.all << self
  end

  def self.all 
    @@all
  end

  def allergen_ingredient
    Allergen.all.select do |a|
      a.ingredient == self
    end 
  end 

  def self.most_common_allergen
    most_common= nil
    most_common_num = 0
  
    self.all.each do |r|
      if r.allergen_ingredient.length > most_common_num
        most_common = r
        most_common_num = r.allergen_ingredient.length
      end
    end 
      most_common   
  end

end

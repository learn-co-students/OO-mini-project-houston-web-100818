class Ingredient

    @@all = []
    attr_accessor :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def allergen_count
        array_count = Allergen.all.select do | allergen |
            allergen.ingredient == self
        end
        array_count.length
    end

    def self.most_common_allergen
        biggest_allergen_count = 0 
        most_common_allergen = nil

        @@all.each do | ingredient |
            if ingredient.allergen_count > biggest_allergen_count
                biggest_allergen_count = ingredient.allergen_count
                most_common_allergen = ingredient
            end
        end
    most_common_allergen
    end

end
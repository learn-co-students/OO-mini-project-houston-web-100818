class RecipeCard

    attr_accessor :user, :recipe, :rating, :date

    @@all = []

    def initialize(user, recipe, rating, date)
        @user = user
        @recipe = recipe
        @rating = rating
        @date = date
        @@all << self
    end

    def self.all
        @@all
    end

end
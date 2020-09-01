require 'pry'

class Bakery

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def desserts #returns an array of dessert objects that are at our bakery
    Dessert.all.select {|inst_dessert| inst_dessert.bakery == self}
  end

#To return an array of all the ingredients of all the dessert objects at our bakery
  def ingredients 
    Ingredient.all.select {|inst_ingredient| inst_ingredient.bakeries.include?(self)}
  end

  def average_calories
    sum = 0.0
    array_of_calories = self.desserts.map { |dessert|
      dessert.calories
    }
    sum = array_of_calories.sum
    average = sum / self.desserts.count
  end

  def shopping_list
    name_array = self.ingredients.map { |ingredient|
      ingredient.name
    }
    name_array.join(", ")
  end

  def self.all
    @@all
  end
end



class Dessert

  attr_accessor :name, :bakery
  @@all = []

  def initialize(name, bakery)
    @name = name
    @bakery = bakery
    @@all << self
  end

  def ingredients #to return an array of ingredient for the recipe of this dessert object
    recipe_of_this_dessert = Recipe.all.find {|inst_recipe| inst_recipe.dessert == self} 

    if recipe_of_this_dessert != nil
      recipe_of_this_dessert.ingredients
    else
      []
    end
  end

  def calories #adds calories for each ingredient for this(self) dessert
    sum = 0.0
    self.ingredients.each do |inst_ingredient| 
      sum += inst_ingredient.calories
    end
    sum
  end

  def self.all
    @@all
  end
end


class Recipe #join_table for ingredient and dessert

  attr_accessor :ingredients, :dessert
  @@all = []

  def initialize(ingredients, dessert)
    @ingredients = ingredients
    @dessert = dessert
    @@all << self
  end

  def ingredient_list
    name_array = @ingredients.map { |ingredient|
      ingredient.name
    }
    name_array.join(", ")
  end

  def self.all
    @@all
  end
end


class Ingredient

  attr_accessor :name, :calories
  @@all = []

  def initialize(name, calories)
    @name = name
    @calories = calories
    @@all << self
  end

  def dessert#return array of desserts
    Dessert.all.select {|inst_dessert| inst_dessert.ingredients.include?(self)}
  end

  def bakeries
    self.dessert.map {|inst_dessert| inst_dessert.bakery}
  end

  def self.find_all_by_name(ingredient_name)
    Ingredient.all.select {|inst_ingredient| inst_ingredient.name.include?(ingredient_name)}
  end

  def self.all
    @@all
  end
end

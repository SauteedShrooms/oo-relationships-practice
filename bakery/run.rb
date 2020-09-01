require_relative './bakery.rb'

good_bakery = Bakery.new("Pie Yum")
evil_bakery = Bakery.new("Yucky Pie")

puts "Bakery names:"
puts good_bakery.name
puts evil_bakery.name

#good bakery's desserts
cherry_pie = Dessert.new("Cherry Pie", good_bakery)
flan = Dessert.new("Flan", good_bakery)

#evil bakery's desserts
apple_pie = Dessert.new("Apple Pie", evil_bakery)
candied = Dessert.new("Candied Apple", evil_bakery)

puts "Good Bakery's Desserts:"
good_bakery.desserts.each { |dessert|
    puts dessert.name
}

puts "Evil Bakery's Desserts:"
evil_bakery.desserts.each { |dessert|
    puts dessert.name
}

flour = Ingredient.new("Flour", 200)
apple = Ingredient.new("Apple", 100)
cherry = Ingredient.new("Cherry", 100.25)
sugar = Ingredient.new("Sugar", 1000)
eggs = Ingredient.new("Egg", 150)

puts "Ingredients for desserts"
Ingredient.all.each { |ingredient|
    puts ingredient.name
}


apple_pie_recipe = Recipe.new([flour, apple, sugar, eggs], apple_pie)
cherry_pie_recipe = Recipe.new([flour, cherry, sugar, eggs], cherry_pie)
flan_recipe = Recipe.new([sugar, eggs], flan)
candied_recipe = Recipe.new([sugar,apple], candied)

puts "Apple Pie Recipe:"
puts apple_pie_recipe.dessert.name
puts apple_pie_recipe.ingredient_list

puts "Desserts which include flour:"
flour.dessert.each { |dessert|
    puts dessert.name
}

puts "Good Bakery's ingredients:"
good_bakery.ingredients.each { |ingredient|
    puts ingredient.name
}

puts "Cherry Pie's calories:"
puts cherry_pie.calories

puts "Flan's calories:"
puts flan.calories

puts "Average calories at Good Bakery"
puts good_bakery.average_calories

puts "Good Bakery shopping list:"
puts good_bakery.shopping_list

apple_syrup = Ingredient.new("Apple Syrup", 666)

puts "All ingredients containing 'apple'"
Ingredient.find_all_by_name("Apple").each { |ingredient|
    puts ingredient.name
}
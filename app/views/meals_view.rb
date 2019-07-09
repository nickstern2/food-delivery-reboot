require 'pry-byebug'

class MealsView
  def display_meals(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}. #{meal.name} ($#{meal.price})"
    end
  end

  def ask_user_for_name
    puts "What's the meal name?"
    gets.chomp
  end

  def ask_user_for_price
    puts "What's the meal price?"
    gets.chomp.to_i
  end

  def ask_user_for_id
    puts "What's the id you want to search"
    gets.chomp.to_i
  end

  def display_searched_meal(searched_meal)
    puts "Meal ##{searched_meal.id}: #{searched_meal.name} ($#{searched_meal.price})"
  end
end












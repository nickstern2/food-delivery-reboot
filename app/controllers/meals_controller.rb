require_relative '../views/meals_view'
require 'pry-byebug'

class MealsController
  def initialize(meal_repository)
    @meal_repo = meal_repository
    @meal_view = MealsView.new
  end

  def list
    all_meals = @meal_repo.all
    @meal_view.display_meals(all_meals) # array of Meal instances
  end

  def add
    name = @meal_view.ask_user_for_name
    price = @meal_view.ask_user_for_price

    added_meal = Meal.new(
      name: name,
      price: price
    )

    @meal_repo.add(added_meal)
  end

  def find
    search_id = @meal_view.ask_user_for_id
    found_meal = @meal_repo.find(search_id)

    @meal_view.display_searched_meal(found_meal)
  end
end












require 'pry-byebug'
require 'csv'
require_relative '../models/meal'

class MealRepository
  def initialize(filepath)
    @csv_file_path = filepath
    @meals = []
    @new_meal_id = 1 #always store the first id in the csv as 1

    load_csv if File.exist? filepath
  end

  def all
    return @meals
  end

  def add(new_meal) # new_meal ==> Meal instance
    new_meal.id = @new_meal_id
    @meals << new_meal
    write_to_csv
    @new_meal_id += 1
  end

  def find(search_id)
    # condition = search_id == the id of the meal
    @meals.find do |meal|
      meal.id == search_id
    end
  end

  private

  def load_csv
    csv_options = { headers: true, header_converters: :symbol }

    CSV.foreach(@csv_file_path, csv_options) do |row|
      # convert id and price because it's not suppose to be a string
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i

      @meals << Meal.new(row)
    end

    @new_meal_id = @meals.last.id + 1
  end

  def write_to_csv
    csv_options = { col_sep: ',' }

    CSV.open(@csv_file_path, 'wb', csv_options) do |csv|
      csv << ['id','name','price']
      @meals.each do |meal|
        # creating the row for my csv
        id = meal.id
        name = meal.name
        price = meal.price

        csv << [id, name, price]
      end
    end
  end
end







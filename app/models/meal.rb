class Meal
  attr_reader :name, :price
  attr_accessor :id

  def initialize(properties)
    @id = properties[:id] # Integer
    @name = properties[:name] # String
    @price = properties[:price] # Integer
  end
end

class Customer
  attr_reader :name, :address
  attr_accessor :id

  def initialize(properties)
    @id = properties[:id] # Integer
    @name = properties[:name] # String
    @address = properties[:address] # String
  end
end

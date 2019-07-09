require_relative '../views/customers_view'
require 'pry-byebug'

class CustomersController
  def initialize(customer_repository)
    @customer_repo = customer_repository
    @customer_view = CustomersView.new
  end

  def list
    all_customers = @customer_repo.all
    @customer_view.display_customers(all_customers) # array of Meal instances
  end

  def add
    name = @customer_view.ask_user_for_name
    address = @customer_view.ask_user_for_address

    added_customer = Customer.new(
      name: name,
      address: address
    )

    @customer_repo.add(added_customer)
  end
end












require 'pry-byebug'

class CustomersView
  def display_customers(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1}. #{customer.name} (#{customer.address})"
    end
  end

  def ask_user_for_name
    puts "What's the customer name?"
    gets.chomp
  end

  def ask_user_for_address
    puts "What's the customer address?"
    gets.chomp
  end

  def ask_user_for_id
    puts "What's the id you want to search"
    gets.chomp.to_i
  end

  def display_searched_customer(searched_customer)
    puts "Customer ##{searched_customer.id}: #{searched_customer.name} ($#{searched_customer.address})"
  end
end












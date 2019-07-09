class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    puts "Welcome to the Food Delivery!"
    puts "           --           "

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @meals_controller.find
    when 4 then @customers_controller.list
    when 5 then @customers_controller.add
    when 6 then stop
    else
      puts "Please type the number of what do you want to do"
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - List all meals"
    puts "2 - Add a meal"
    puts "3 - Find one meal"
    puts "4 - List all customers"
    puts "5 - Add a customer"
    puts "6 - Stop and exit the program"
  end
end

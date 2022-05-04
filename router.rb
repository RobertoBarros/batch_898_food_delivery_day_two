class Router

  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
  end

  def run

    @employee = @sessions_controller.sign_in

    loop do
      if @employee.manager?
        print_actions_manager
        action = gets.chomp.to_i
        dispatch_manager(action)
      else
        print_actions_rider
        action = gets.chomp.to_i
        dispatch_rider(action)
      end
    end
  end

  private

  def print_actions_manager
    puts '------------------------'
    puts '1. Create a Meal'
    puts '2. List meals'
    puts '------------------------'
    puts '3. Create a Customer'
    puts '4. List customers'
    puts '------------------------'
    puts '5. Create Order'
    puts '6. List undelivered Orders'
    puts '------------------------'

    puts 'Enter a number:'
  end

  def dispatch_manager(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then @orders_controller.add
    when 6 then @orders_controller.list_undelivered_orders
    else
      puts "Invalid option"
    end
  end

  def print_actions_rider
    puts '-------------------------------'
    puts '1. List my undelivered orders'
    puts '2. Mark order as delivered'
    puts '-------------------------------'

    puts 'Enter a number:'
  end

  def dispatch_rider(action)
    case action
    when 1 then @orders_controller.list_my_orders(@employee)
    when 2 then @orders_controller.mark_as_delivered(@employee)
    else
      puts "Invalid option"
    end
  end


end

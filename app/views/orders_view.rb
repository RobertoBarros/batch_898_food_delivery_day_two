class OrdersView

  def ask_index
    puts "Enter index:"
    gets.chomp.to_i - 1
  end

  def display_riders(employees)
    employees.each_with_index do |employee, index|
      puts "#{index + 1} - #{employee.username}"
    end
  end

  def display(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1} - #{order.meal.name} ordered by #{order.customer.name} delivered by #{order.employee.username} "
    end
  end
end

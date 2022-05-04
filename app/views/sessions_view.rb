class SessionsView

  def ask_username
    puts "Username?"
    gets.chomp
  end

  def ask_password
    puts "Password?"
    gets.chomp
  end

  def wrong_credentials
    puts "Wrong credentials... Try again!"
  end

  def welcome(employee)
    puts "welcome #{employee.username}"
  end
end

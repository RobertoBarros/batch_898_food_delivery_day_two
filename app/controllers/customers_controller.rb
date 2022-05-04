require_relative '../views/customers_view'

class CustomersController

  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomersView.new
  end

  def add
    #1. Perguntar o nome do customer
    name = @view.ask_name

    #2. Perguntar o endereço do customer
    address = @view.ask_address

    #3. Instanciar um novo customer
    customer = Customer.new(name: name, address: address)

    #4. Adicionar o customer ao repositório
    @customer_repository.create(customer)
  end

  def list
    # 1. Pegar todos os customers do repositório
    customers = @customer_repository.all


    # 2. Mandar para a view exibir
    @view.display(customers)
  end

end

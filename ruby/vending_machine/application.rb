class Drink
  attr_reader :name, :price
  def self.pepsi
    new('pepsi', 150)
  end

  def self.irohasu
    new('いろはす',120)
  end

  def self.monstar
    new('monstar',300)
  end
    
  def initialize(name, price)
    @name = name
    @price = price
  end
end

class VendingMachine
  attr_reader :stock_list
  def initialize
    @stock_list = {}
    5.times{store(Drink.pepsi)}
  end

  def store(drink)
    @stock_list[drink.name] =
    { price: drink.price,
      drinks:[]} unless @stock_list.has_key?(drink.name)
      @stock_list[drink.name][:drinks] << drink
    end
end


vm = VendingMachine.new
p vm.stock_list
class Drink
 attr_accessor :name, :price
 def self.pepsi
  self.new('pepsi',150)
 end

 def self.irohasu
   self.new()
 end

 def initialize(name,price)
  @name = name
  @price = price
 end
 
 
end

class VendingMachine
  attr_accessor :stocks
  def initialize(stocks = { 'pepsi' => { price: 150, quantity: 5 } })
    @stocks = stocks
  end

  
   
  def store(drink,quantity)
    if @stocks.key?(drink.name) 
       @stocks[drink.name][:quantity] += quantity
    else
       @stocks[drink.name][:quantity] = quantity
    end
  end

  def all_list_of_purchaseable_drinks
      @stocks.select{|| quantity > 0}
    
  end
end
pepsi = Drink.new('pepsi',150)
vending_machine = VendingMachine.new
p vending_machine.all_list_of_purchaseable_drinks

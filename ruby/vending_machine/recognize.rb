class Drink
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end

class VendingMachine
  attr_accessor :stocks
  attr_reader :prices, :sales_amount

  def initialize
    pepsi = Drink.new('pepsi', 150)
    water = Drink.new('water', 120)
    redble = Drink.new('redble', 200)
    stock_table = { pepsi => 5, water => 5, redble => 5 }
    prices = { pepsi => pepsi.price, water => wtaer.price, redble => recble.price }
    @stock_table = stock_table
    @prices = prices
  end
end

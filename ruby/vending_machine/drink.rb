class Drink  
  def initialize(kind, price)
    @kind = kind
    @price = price
  end 

  def kind
    @kind
  end

  def price
    @price
  end
end

pepsi = Drink.new('pepsi', 150)
p pepsi.name

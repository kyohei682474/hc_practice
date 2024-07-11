class VendingMachine
  attr_accessor :stock
#  デフォルト値としてpepsiの在庫を５本とする 
  def initialize(stock = {'pepsi' => 5})
    @stock = stock
  end

  
# ストックがある場合と全くない場合の補充の条件
  def add_drink(drink, quantity)
    if @stock.key?(drink.kind)
      @stock[drink.kind] += quantity 
    else
      @stock[drink.kind] = quantity
    end
  end
# ジュースが注文されストックが消費された時の条件
  def decrease_drink(drink, quantity)
    if @stock.key?(drink.kind) && @stock[drink.kind]> 0
       @stock[drink.kind] = -1
       true
    else
      false  
    end
    
  end

  def default_stock_of_drink(drink)
    @stock(drink.kind) || 0
  end


end


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


pepsi = Drink.new('pepsi',150)
vending_machine = VendingMachine.new
p vending_machine.stock
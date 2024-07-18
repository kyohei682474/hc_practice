class Drink
  attr_accessor :name, :price
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

  def purchase(drink_name)
    if purchasable?(drink_name)
      # 購入されたドリンクのオブジェクト
      drink = @store_list[drink_name][:drinks].pop
      @sale_amount += drink.price
      @total -= drink.price
      [drink, refund]
    end
  end

  def purchasable?(drink_name)
    purchasable_drink_names.include?(drink_name)
  end
   
  def purchasable_drink_names
    @stock_list.select{|_, info| 
    info[:price] <= suica.money && info[:dirnks].any? }.keys
  end

  def drink_name
    @drink_name = drink.name
  end

end

class Suica 

  attr_accessor :money, :charge
  def initialize(money = 500)
    @money = money
    @charge = charge
  end

  
  def add_charge(charge)
    if charge >= 100 
       @money += charge
    else
      false
  end
  

 end


end

suica = Suica.new
p suica.add_charge(100)
p suica.add_charge(200)

vm = VendingMachine.new
vm.store(Drink.irohasu)
vm.store(Drink.monstar)
p vm.stock_list
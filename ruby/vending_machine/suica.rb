

# class Suica
#  def initialize(money = 500)
#   @money = money
#   @stock_of_suica = stock_of_suica
#  end

#  def money 
#   @money
#  end

#  def money=(value)
#   @money = value
#  end

#  def stock_of_suica
#    @stock_of_suica
#  end

#  def stock_of_suica=(value)
#    @stock_of_suica = value
#  end

#  def charge(charged)
#   if charged >= 100
#    p  @stock_of_suica =  @money + charged
#     true
#   else
#     false
#   end
#  end
# end


# suica = Suica.new
# p suica.money
# suica.charge(500)
# p suica.stock_of_suica
# 
#drinks = {'pepsi' => 5, 'いろはす' => 5, 'monstar' => 5}
# @drinks = drinks
# p drinks.select{|kind, quantity| quantity > 0}.class 

# drinks.select{|kind, quantity| quantity > 0}.each{|key,_|
#   "ジュース名: #{key}  "}
# initialize()
# class Drink
#   attr_reader :name, :price
#   def initialize
#     @name = name
#     @price = price
#   end
  
# end
# class VendingMachine
#   attr_reader :stocks
#   def initialize(stocks = {:name =>'pepsi', :price => 150, :quantity => 5})
#     @stocks = stocks
#   end

#   def purchasable_drink_list(suica)
#     if stocks.key?(:name) && stocks[:quantity] > 0 && suica.money> stocks[:price]
#       @stocks[:name]
#     else
#       false
#     end
    
#   end

#   def stocks_drink_list
#     if stocks.key?(:name) && stocks[:quantity] > 0
#       @stocks[:name]
#     else
#       false
#     end
#   end

# end


# class Suica
#   def initialize(money = 500)
#    @money = money
#   end
 
#   def money 
#    @money
#   end
 
#   def money=(value)
#    @money = value
#   end
  
#   def charge(charged)
#    if charged >= 100
#        @money += charged
#      true
#    else
#      raise "100円未満はチャージできません。 チャージ金額は#{charged}円です。"
#    end
#   end
#  end
# vm = VendingMachine.new
# suica = Suica.new
# p vm.stocks[:name] 
# p vm.stocks[:price].class
# p vm.purchasable_drink_list(suica)
# p vm.stocks_drink_list


class Drink
  attr_accessor :name, :price 
 def initialize(name,price)
     @name = name
     @price = price
 end  

end

class VendingMachine
  attr_accessor :stocks 
  def initialize(stocks = {'water' => {price:100 ,quantity:5 }, 'cola' => {price: 120, quantity: 5}})
    @stocks = stocks
    @sales_amount = sales_amount
  end

  def stocks_drink_list
    stocks.each do |key, value|
      puts "ストックされているドリンクは #{key}。 本数は #{value[:quantity]}本"
    end
  end

  def purchase(drink,suica)
    if stocks.key?(drink.name) && stocks[drink.name][:quantity] > 0 && suica.money >= stocks[drink.name][:price]
       stocks[drink.name][:quantity] -= 1
       suica.deduct_money(stocks[drink.name][:price]) 
       update_sales_amount(stocks[drink.name][:price])
    else
      "購入できません"
    end
  end

  def update_sales_amount(amount)
      @sales_amount += amount 
  end

  def sales_amount
    @sales_amount
  end  
private
  def 
  

  
  
end

class Suica
  def initialize(money)
    @money = money
  end

  def money
    @money
  end

  def deduct_money(amount)
    if @money > amount
       @money -= amount
    else
       "お金が足りません"
    end
  end

private
  def money=(value)
    @money = value
  end
end

water = Drink.new('water',100)
vm = VendingMachine.new
p vm.stocks
p vm.stocks['water']
vm.stocks_drink_list

suica = Suica.new(500)
p suica.money
p vm.purchase(water,suica)
p suica.money
p vm.stocks
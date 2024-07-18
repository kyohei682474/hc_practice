

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
  attr_accessor :stocks ,:prices
  def initialize(stocks = {'water' => 5, 'cola' => 5, }, prices = {'water' => 100, 'cola' => 120 })
    @stocks = stocks
    @prices = prices
  end
  
end

vm = VendingMachine.new
p vm.stocks
p vm.prices
p vm.stocks['water']
p vm.prices['water']
stocks.class
stocks.map do |stock|
  p stock
end
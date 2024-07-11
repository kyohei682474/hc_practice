

class Suica
 def initialize(money = 500)
  @money = money
  @stock_of_suica = stock_of_suica
 end

 def money 
  @money
 end

 def money=(value)
  @money = value
 end

 def stock_of_suica
   @stock_of_suica
 end

 def stock_of_suica=(value)
   @stock_of_suica = value
 end

 def charge(charged)
  if charged >= 100
   p  @stock_of_suica =  @money + charged
    true
  else
    false
  end
 end
end


suica = Suica.new
p suica.money
suica.charge(500)
p suica.stock_of_suica

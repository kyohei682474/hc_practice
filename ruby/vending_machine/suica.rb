# class Suica
#   DEPOSIT = 500
#   def initialize(money = DEPOSIT,charge)
#     @money = money
#     @charge = charge
#   end
#   # セッターメソッド
#   def money
#     @money
#   end

#   def money=(value)
#     @money = value
#   end

#   def charge
#     @charge
#   end

#   def charge=(value)
#     @charge = value
#   end

#   def charged
#      if @charge >= 100
#       @money + @charge
#      else @charge < 100
#       puts "100円以上チャージしてください。"
#       @money
#      end
#   end

#   def check
#     @money
#   end
# end


# suica = Suica.new(100)
# p suica.charged
# suica = Suica.new(100)

# # チャージ後の値の更新
#   suica.money = suica.charged
# p suica.check

class Suica
 DEPOSIT = 500
 def initialize(money)
  @money = money
 end

 def money 
  @money
 end

 def money=(value)
  @money = value
 end

 def charge
  if @money >= 100
    DEPOSIT + @money
  else
    DEPOSIT
  end
end

  def balance_of_suica
    @money = charge 
  end
end

suica = Suica.new(100)
p suica.charge
p suica.balance_of_suica
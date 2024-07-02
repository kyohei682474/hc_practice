class Suica
  DEPOSIT = 500
  def initialize(money = DEPOSIT,charge)
    @money = money
    @charge = charge
  end
# セッターメソッド
  def money
    @money 
  end

# ゲッターメソッド
  def money=(value)
    @money = value
  end

  def charged
    @money + @charge
  end

  def check_balance
    @money
  end
end
suica = Suica.new(1000)
p suica.money
p suica.charged
p suica.money = suica.charged
p suica.check_balance


class VendingMachine
  attr_accessor :stock
#  デフォルト値としてpepsiの在庫を５本とする 
  def initialize(stock = {'pepsi' => 5, 'いろはす' => 5, 'monstar' => 5})
    @stock = stock
    @sales_amount = 0
  end

  
# ストックがある場合と全くない場合の補充の条件
  def add_drink(drink, quantity)
    if @stock.key?(drink.kind) 
      @stock[drink.kind] += quantity 
    else
      @stock[drink.kind] = quantity
    end
  end
  # ジュースが注文されストックが消費された時の条件。さらにsuicaの残高も減る。
  def purchase_drink(drink, suica)
    if @stock.key?(drink.kind) && @stock[drink.kind]> 0 && suica.money >= drink.price
       @stock[drink.kind] -= 1
       suica.money -= drink.price
       update_sales_amount(drink.price)
       true
    else
      exception_handling_of_purchase_drink(drink, suica)
    end
  end
# 購入可能な商品リスト
    def purchaseable_drink_list
      #   stock.select{|kind, quantity| quantity > 0}.each_key do |key|
      #   key
      #  end
      @stock.select { |kind, quantity| quantity > 0 }.keys.join("\n")
    end
    


  # 購入における例外処理用のメソッド
  def exception_handling_of_purchase_drink(drink, suica)
    if @stock.key?(drink.kind) && @stock[drink.kind] == 0 
      raise puts "在庫がありません"
    else @stock.key?(drink.kind) && @stock[drink.kind]> 0 && suica.money < drink.price
      raise 
    end
  end
 
  # 売上金額の更新
  def update_sales_amount(amount)
    # 売上金額を格納する
     @sales_amount += amount
  end

# ゲッター、売り上げを確認するメソッド
  def sales_amount
    @sales_amount
  end

end

# Drinkクラス
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


class Suica
  def initialize(money = 500)
   @money = money
  end
 
  def money 
   @money
  end
 
  def money=(value)
   @money = value
  end
  
  def charge(charged)
   if charged >= 100
       @money += charged
     true
   else
     raise "100円未満はチャージできません。 チャージ金額は#{charged}円です。"
   end
  end
 end

suica = Suica.new
pepsi = Drink.new('pepsi',150)
vending_machine = VendingMachine.new
# vending_machine.stock

# 例外を発生させる
# begin
#   suica.charge(50)
# rescue RuntimeError => e
#   puts "チャージ金額が100円未満のためにエラーが生じています。"
#   puts "エラー:#{e.class} #{e.message}"
# end
# vending_machine.purchase_drink(pepsi,suica)
# irohasu = Drink.new('いろはす',120)
# vending_machine.add_drink(irohasu,5)
# vending_machine.add_drink(pepsi,5)
# vending_machine.stock

puts vending_machine.purchaseable_drink_list



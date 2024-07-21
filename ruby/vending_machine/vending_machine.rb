
class VendingMachine
#  デフォルト値としてpepsiの在庫を５本とする 
  def initialize(stocks = {'pepsi' => 5, 'いろはす' => 5, 'monstar' => 5},prices ={'pepsi' => 150, 'いろはす' => 120, 'monstar' => 300})
    @stocks = stocks
    @prices = prices
    @sales_amount = 0
  end

  def stocks
    @stocks
  end

  def stocks=(value)
    @stocks = value
  end

  def prices
    @prices
  end


  
# ストックがある場合と全くない場合の補充の条件
  def add_drink(drink, quantity)
    if @stocks.key?(drink.name) 
      @stocks[drink.name] += quantity 
    else
      @stocks[drink.name] = quantity
    end
  end
  # ジュースが注文されストックが消費された時の条件。さらにsuicaの残高も減る。
  def purchase_drink(drink, suica)
    if @stocks.key?(drink.name) && @stocks[drink.name]> 0 && suica.deduct_money(drink.price) == true
       @stocks[drink.name] -= 1
       suica.deduct_money(drink.price)
       update_sales_amount(drink.price)
    else
      exception_handling_of_purchase_drink(drink, suica)
    end
  end
# 購入可能な商品リスト
    def purchasable_drink_list(suica)
      stocks.select{|name, quantity| quantity > 0 && suica.money >= @prices[name]}.keys
    end
    # 購入における例外処理用のメソッド
  def exception_handling_of_purchase_drink(drink, suica)
    if @stocks.key?(drink.name) && @stocks[drink.name] == 0 
      raise "在庫がありません"
    elsif @stocks.key?(drink.name) && @stocks[drink.name]> 0 && suica.money < drink.price
      raise "チャージ金額が足りません。"
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
  private 
  def sales_amount=(value)
    @sales_amont = value
  end
end

# Drinkクラス
class Drink  
  def initialize(name, price)
    @name = name
    @price = price
  end 

  def name
    @name
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
#  チャージ金額の減少
  def deduct_money(amount)
    if @money > amount
       @money -= amount
    else
       "チャージ金額が足りません"
    end
  end
  #  suicaのチャージ
  def charge(charged)
   if charged >= 100
       @money += charged
   else
     raise "100円未満はチャージできません。 チャージ金額は#{charged}円です。"
   end
  end

  private
  # セッターメソッド
  def money=(value)
    @money = value
  end 
  
end

 vm = VendingMachine.new
 suica =Suica.new
#  チャージ金額が100未満の例外処理
 begin 
  suica.charge(99)
 rescue
  puts "チャージ金額が不足しています。"
 end

#  初期値の500円を出力
 p suica.money
# suicaに100円チャージしてチャージされたことを確認する。
 p suica.charge(100)

 p suica.money
# ドリンクの名前の値段を呼び出す
 pepsi = Drink.new('pepsi',150)
 p pepsi.name
 p pepsi.price
# ドリンクのストックを確認
 p vm.stocks
#  購入可能なドリンクリスト一覧
 p vm.purchasable_drink_list(suica)
# pepsiを購入後suicaのチャージ残高を減少させる。在庫を減らす。売上金額を増やす。
 vm.purchase_drink(pepsi, suica)
 vm.purchase_drink(pepsi, suica)
 p vm.sales_amount
 p vm.stocks
begin 
  mv.purchase_drink(pepsi, suica)
rescue
  puts "在庫がないかチャージ金額が足りません。"
end

irohasu = Drink.new('いろはす', 120)
monstar = Drink.new('monstar',  230)
vm.add_drink(irohasu, 5)
vm.add_drink(monstar, 5)
p vm.stocks
suica.charge(1000)
p vm.purchasable_drink_list(suica)
vm.purchase_drink(irohasu, suica)
vm.purchase_drink(monstar, suica)
p vm.stocks
p vm.sales_amount
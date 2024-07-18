# class VendingMachine
#   attr_accessor :stocks, :sales_amount
# #  デフォルト値としてpepsiの在庫を５本とする 
#   def initialize(stocks = { name: 'pepsi', price: 150, quantity: 5 } )
#     @stocks = stocks
#     @sales_amount = 0
#   end

  
# # ストックがある場合と全くない場合の補充の条件
#   def add_drink(drink, quantity)
#     if @stocks.key?(:name) 
#       @stocks[:quantity] += quantity 
#     else
#       p @stocks[:name] = drink.name
#       @stocks[:quantity] = quantity
#     end
#   end
#   # ジュースが注文されストックが消費された時の条件。さらにsuicaの残高も減る。
#   def purchase_drink(drink, suica)
#     if @stocks.key?(drink.name) && @stocks[drink.name]> 0 && suica.money >= drink.price
#        @stocks[drink.name] -= 1
#        suica.money -= drink.price
#        update_sales_amount(drink.price)
#        true
#     else
#       exception_handling_of_purchase_drink(drink, suica)
#     end
#   end

# # 購入可能な商品リスト
#     def purchasable_drink_list
#       #  stocks.select{|name, quantity| quantity > 0}.map do |key,_| 
#       #   key
#       #  end
#       # @stocks.select{ |name, quantity| quantity > 0 }.keys
#     #  if stocks.select{|name, quantity| quantity > 0} && suica.money > drink.price
#        purchasable_dirnk_name
#      end
    
#     # 自動販売機に登録されている飲み物の名前
#     def drink_name
#       @stocks[:name]
#     end


#   # 購入における例外処理用のメソッド
#   def exception_handling_of_purchase_drink(drink, suica)
#     if @stocks.key?(drink.name) && @stocks[drink.name] == 0 
#       raise puts "在庫がありません"
#     else @stocks.key?(drink.name) && @stocks[drink.name]> 0 && suica.money < drink.price
#       raise 
#     end
#   end
 
#   # 売上金額の更新
#   def update_sales_amount(amount)
#     # 売上金額を格納する
#      @sales_amount += amount
#   end

# # ゲッター、売り上げを確認するメソッド
#   def sales_amount
#     @sales_amount
#   end

# end

# # Drinkクラス
# class Drink  
#   def initialize(name, price)
#     @name = name
#     @price = price
#   end 

#   def name
#     @name
#   end

#   def price
#     @price
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

# suica = Suica.new
# pepsi = Drink.new('pepsi', 150)
# irohasu = Drink.new('いろはす', 120)
# vm = VendingMachine.new
# p vm.add_drink(irohasu,5)
# p vm.stocks
# # vending_machine.stocks

# # 例外を発生させる
# # begin
# #   suica.charge(50)
# # rescue RuntimeError => e
# #   puts "チャージ金額が100円未満のためにエラーが生じています。"
# #   puts "エラー:#{e.class} #{e.message}"
# # end
# # vending_machine.purchase_drink(pepsi,suica)
# # irohasu = Drink.new('いろはす',120)
# # vending_machine.add_drink(irohasu,5)
# # vending_machine.add_drink(pepsi,5)
# # vending_machine.stocks




class VendingMachine
  attr_accessor :stocks, :sales_amount
#  デフォルト値としてpepsiの在庫を５本とする 
  def initialize(stocks = {'pepsi' => 5, 'いろはす' => 5, 'monstar' => 5},prices ={'pepsi' => 150, 'いろはす' => 120, 'monstar' => 300})
    @stocks = stocks
    @prices = prices
    @sales_amount = 0
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
    if @stocks.key?(drink.name) && @stocks[drink.name]> 0 && suica.money >= drink.price
       @stocks[drink.name] -= 1
       suica.money -= drink.price
       update_sales_amount(drink.price)
       true
    else
      exception_handling_of_purchase_drink(drink, suica)
    end
  end
# 購入可能な商品リスト
    def purchasable_drink_list(suica)
      #  stocks.select{|name, quantity| quantity > 0}.map do |key,_| 
      #   key
      #  end
      # @stocks.select{ |name, quantity| quantity > 0 }.keys
     if stocks.select{|name, quantity| quantity > 0 && suica.money >= @prices[name]}.keys
        @stocks.keys 
     else
      false
     end
    end
    # 購入における例外処理用のメソッド
  def exception_handling_of_purchase_drink(drink, suica)
    if @stocks.key?(drink.name) && @stocks[drink.name] == 0 
      raise puts "在庫がありません"
    else @stocks.key?(drink.name) && @stocks[drink.name]> 0 && suica.money < drink.price
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
 
  def money=(value)
   @money = value
  end
  
  def charge(charged)
   if charged >= 100
       @money += charged
   else
     raise "100円未満はチャージできません。 チャージ金額は#{charged}円です。"
   end
  end
 end

 vm = VendingMachine.new
 suica =Suica.new
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
 p vm.purchase_drink(pepsi, suica)
 p vm.purchase_drink(pepsi, suica)
 p vm.sales_amount
 p suica.money
 p vm.stocks


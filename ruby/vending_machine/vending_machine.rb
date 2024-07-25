class VendingMachine
  attr_accessor :stocks
  attr_reader :prices, :sales_amount

  #  デフォルト値としてpepsiの在庫を５本とする
  def initialize
    pepsi = Drink.new('pepsi', 150)
    irohasu = Drink.new('いろはす', 120)
    monstar = Drink.new('monstar', 300)
    @stocks = { pepsi => 5, irohasu => 5, monstar => 5 }
    @prices = { pepsi => pepsi.price, irohasu => irohasu.price, monstar => monstar.price }
    @sales_amount = 0
  end

  def stock_list
    @stocks.map do |key, value|
      "#{key.name} 残り#{value}本 "
    end
  end

  # ストックがある場合と全くない場合の補充の条件
  def add_drink(drink, quantity)
    # p @stocks[drink] += quantity
    if @stocks.key?(drink)
      @stocks[drink] += quantity
    else
      @stocks[drink] = quantity
    end
  end

  # ジュースが注文されストックが消費された時の条件。さらにsuicaの残高も減る。
  def purchase_drink(drink, suica)
    if @stocks.key?(drink) && (@stocks[drink]).positive? && suica.deduct_money(drink.price)
      @stocks[drink] -= 1
      update_sales_amount(drink.price)
    else
      exception_handling_of_purchase_drink(drink, suica)
    end
  end

  # 購入可能な商品リスト
  def purchasable_drink_list(suica)
    #   stocks.select { |name, quantity| quantity > 0 && suica.money >= @stock[name] }.keys
    @stocks.select { |drink, quantity| quantity > 0 && suica.money >= drink.price }.keys.map { |drink| drink.name }
  end

  # 購入における例外処理用のメソッド
  def exception_handling_of_purchase_drink(drink, suica)
    if @stocks.key?(drink) && @stocks[drink] == 0
      raise '在庫がありません'
    elsif @stocks.key?(drink) && @stocks[drink] > 0 && suica.money < drink.price
      raise 'チャージ金額が足りません。'
    end
  end

  # 売上金額の更新
  def update_sales_amount(amount)
    # 売上金額を格納する
    @sales_amount += amount
  end

  # ゲッター、売り上げを確認するメソッド

  private

  def sales_amount=(value)
    @sales_amont = value
  end
end

vm = VendingMachine.new
vm.stocks

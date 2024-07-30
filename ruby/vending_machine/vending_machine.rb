class VendingMachine
  attr_accessor :stocks
  attr_reader :prices, :sales_amount

  #  デフォルト値としてpepsiの在庫を５本とする
  def initialize
    pepsi = Drink.new('pepsi', 150)
    irohasu = Drink.new('いろはす', 120)
    monstar = Drink.new('monstar', 200)
    @stocks = []
    5.times { add_drink(pepsi) }
    5.times { add_drink(irohasu) }
    5.times { add_drink(monstar) }
    @sales_amount = 0
  end

  # 直接的に呼び出さなくて良い
  def stock_list
    @stocks.map do |stock|
      stock.name
    end
  end

  # 在庫リストと個数の確認
  def stock_list_count
    stock_list.tally
  end

  def add_drink(drink)
    @stocks << drink
  end

  # ジュースが注文されストックが消費された時の条件。さらにsuicaの残高も減る。
  # def purchase_drink(drink, suica)
  #   if @stocks.key?(drink) && (@stocks[drink]).positive? && suica.deduct_money(drink.price)
  #     @stocks[drink] -= 1
  #     update_sales_amount(drink.price)
  #   else
  #     exception_handling_of_purchase_drink(drink, suica)
  #   end
  # end
  #

  def purchase_drink(drink, suica)
    raise '在庫がありません' unless  @stocks.include?(drink)
    raise 'チャージ金額が足りません。' if suica.money < drink.price

    @stocks.delete_at(@stocks.index(drink))
    suica.deduct_money(drink.price)
    update_sales_amount(drink.price)
  end

  # 購入可能な商品リスト
  def purchasable_drink_list(suica)
    #   stocks.select { |name, quantity| quantity > 0 && suica.money >= @stock[name] }.keys
    # @stocks.select { |drink, quantity| quantity > 0 && suica.money >= drink.price }.keys.map { |drink| drink.name }
    @stocks.select { |stock| suica.money >= stock.price }.map { |drink| drink.name }.uniq
    # # (@stocks.select { |stock| stock }).map { |n| n.price }
    # @stocks.include
  end

  # 売上金額の更新
  def update_sales_amount(amount)
    # 売上金額を格納する
    @sales_amount += amount
  end

  # ゲッター、売り上げを確認するメソッド

  private

  attr_writer :sales_amount
end

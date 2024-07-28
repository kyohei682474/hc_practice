require './drink'
require './suica'
require './vending_machine'

pepsi = Drink.new('pepsi', 150)
vm = VendingMachine.new
suica = Suica.new
p suica.money
#  チャージ金額が100未満の例外処理
begin
  suica.charge(99)
rescue StandardError
  puts 'チャージ金額が不足しています。'
end

# ドリンクの名前と金額の確認
p pepsi.name
p pepsi.price
puts vm.stock_list_count

# # ドリンクの購入
vm.purchase_drink(pepsi, suica)
# ストックの確認とSuicaの残金と売り上げ金額確認
p vm.stock_list_count
p suica.money
p vm.sales_amount

# # suicaに100円チャージしてチャージされたことを確認する。
suica.charge(100)
# # #  購入可能なドリンクリスト一覧
p vm.purchasable_drink_list(suica)

irohasu = Drink.new('いろはす', 120)
monstar = Drink.new('monstar', 200)

vm.purchasable_drink_list(suica)
# # pepsiを購入後suicaのチャージ残高を減少させる。在庫を減らす。売上金額を増やす。
# vm.purchase_drink(pepsi, suica)
# p vm.stock_list_count
# # # 在庫がないまたはチャージ金額ない時のエラー
# begin
#   mv.purchase_drink(pepsi, suica)
# rescue StandardError
#   puts '在庫がないかチャージ金額が足りません。'
# end

# p vm.stock_list
# irohasu = Drink.new('いろはす', 120)
# vm.add_drink(irohasu, 10)
# p vm.stock_list

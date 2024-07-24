require './drink'
require './suica'
require './vending_machine'

vm = VendingMachine.new
suica = Suica.new
p vm.stock_list
# #  チャージ金額が100未満の例外処理
# begin
#   suica.charge(99)
# rescue StandardError
#   puts 'チャージ金額が不足しています。'
# end

# #  初期値の500円を出力
p suica.money
# # suicaに100円チャージしてチャージされたことを確認する。
p suica.charge(100)

p suica.money
# ドリンクの名前の値段を呼び出す
pepsi = Drink.new('pepsi', 150)
p pepsi.name
p pepsi.price
# ドリンクのストックを確認

#  購入可能なドリンクリスト一覧
puts vm.purchasable_drink_list(suica)

# # pepsiを購入後suicaのチャージ残高を減少させる。在庫を減らす。売上金額を増やす。
p vm.purchase_drink(pepsi, suica)
# vm.purchase_drink(pepsi, suica)
# p vm.sales_amount
# p vm.stocks
# begin
#   mv.purchase_drink(pepsi, suica)
# rescue StandardError
#   puts '在庫がないかチャージ金額が足りません。'
# end

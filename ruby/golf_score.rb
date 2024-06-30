regulation_numbers_stocks = [3,4,5]
numbers_stocks = [1..45]

#   p number1 = regulation_numbers_stocks.sample(3).join(',')
#   p number2 = regulation_numbers_stocks.sample(3).join(',')
#  p "#{number1},#{number2}"
  # p regulation_numbers_stocks.sample(3).5.times.join(',') 
  # numbers = regulation_numbers_stocks.sample(3).join(',') 
  # p numbers.each {|number| number.join(',')}
# numbers = []

# 18.times {
#  numbers << regulation_numbers_stocks.sample(1)
# }
# p numbers.join(',')

# Answer = []
# X = 3, Y = 2
# if X - Y = -4
#   puts "コンドル"
# elsif X - Y = -3
#   puts "アルバトロス"
# elsif X - Y = -2
#   puts "イーグル"
# elsif X - Y = -1
#   puts "バーディ"
# elsif X - Y = 0
#   puts "パー"
# elsif X = Y = 1
#    puts "ホールインワン"
# elsif X - Y = 1
#   puts "ボギー"
# else X - Y >= 2
#   puts " #{X - Y}ボギー "
# end

puts "規定打数を教えて"
# p score = gets.chomp.delete(',').to_i 2,3,5 =>235
# p score = gets.delete(',').chomp!
# p score = gets.chomp!.gsub!(/,/, " ")
  # p score = gets.chomp!.split(" ") 2,3,4 => ["3,4,5"]
regulation_number_of_strokes = gets.chomp!.split(",").map{|n| n.to_i}
puts "プレイヤー打数"
number_of_strokes = gets.chomp!.split(",").map{|n| n.to_i}

p judgements = [regulation_number_of_strokes, number_of_strokes].transpose.map{|a| a.inject(:-)} 
# p judgements = [number_of_strokes, regulation_number_of_strokes]
# regulation_number_of_strokes.each do |v|
#   p v
# end
# judgement   = stroke - score
# judgement = stroke - score
# judgement = []
# judgements.each do |number_of_stroke,regulation_number_of_stroke|
#  p judgement << regulation_number_of_stroke - number_of_stroke
comprehensive_judgements = []
comprehensive_judgements << judgements.each do |judgement|
if judgement >= 2
  puts "#{judgement}ボギー"
elsif judgement == 1
  puts "ボギー"
elsif judgement == 0 && (number_of_strokes == 1 && number_of_strokes == 1)
  puts "ホールインワン"
elsif judgement == -1
  puts "バーディー"
elsif judgement == -2
  puts "イーグル"
elsif judgement == -3 && (number_of_strokes == 5 && number_of_strokes  == 2)
  puts "アルバトス"
elsif judgement == -4
  puts "コンドル"
end
end
p comprehensive_judgements
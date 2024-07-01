puts "規定打数を入力"
# 
regulation_number_of_strokes = gets.chomp!.split(",").map{|n| n.to_i}
puts "打数を入力"
number_of_strokes = gets.chomp!.split(",").map{|n| n.to_i}
# 打数から規定打数を引いた値を配列として格納

# judgements = [number_of_strokes, regulation_number_of_strokes].transpose.map{|a| a.inject(:-)} 
[regulation_number_of_strokes, number_of_strokes].transpose
# 結果を格納
# comprehensive_judgements = []
# judgements.each do |judgement|
# if judgement >= 2
#   puts "#{judgement}ボギー "
# elsif judgement == 1
#   puts "ボギー" 
# elsif judgement == 0 && (regulation_number_of_strokes == 1 && number_of_strokes == 1)
#   puts "ホールインワン" 
# elsif judgement == -1 
#   puts "バーディー" 
# elsif judgement == -2
#   puts "イーグル" 
# elsif judgement == -3 && (regulation_number_of_strokes == 5 && number_of_strokes == 2)
#   puts "アルバトス" 
# elsif judgement == -4
#   puts "コンドル" 
# end
# end
# p comprehensive_judgements
comprehensive_judgements = []

[regulation_number_of_strokes, number_of_strokes].transpose.each do |regulation_number_of_stroke, number_of_stroke|
  if number_of_stroke - regulation_number_of_stroke >= 2
    comprehensive_judgements << "#{number_of_stroke - regulation_number_of_stroke}ボギー"
  elsif number_of_stroke - regulation_number_of_stroke == 1
    comprehensive_judgements << "ボギー" 
  elsif number_of_stroke - regulation_number_of_stroke == 0 && (regulation_number_of_stroke == 1 && number_of_stroke == 1)
    comprehensive_judgements << "ホールインワン" 
  elsif number_of_stroke - regulation_number_of_stroke == 0 && (regulation_number_of_stroke >= 2 && number_of_stroke >= 2)
    comprehensive_judgements << "パー"
  elsif number_of_stroke - regulation_number_of_stroke == -1 
    comprehensive_judgements << "バーディー" 
  elsif number_of_stroke - regulation_number_of_stroke == -2
    comprehensive_judgements << "イーグル" 
  elsif number_of_stroke - regulation_number_of_stroke == -3 && (regulation_number_of_stroke == 5 && number_of_stroke == 2)
    comprehensive_judgements << "アルバトス" 
  elsif number_of_stroke - regulation_number_of_stroke == -4
    comprehensive_judgements << "コンドル" 
  end
end
 p comprehensive_judgements.join(',')

# # 入力された値を配列にする
regulation_number_of_strokes = gets.chomp.split(",").map(&:to_i)

# # 入力された値を配列にする
number_of_strokes = gets.chomp.split(',').map(&:to_i)

[regulation_number_of_strokes, number_of_strokes].transpose
# 最終出力を格納するための空の配列を作成
comprehensive_judgements = []
# 条件分けして結果を出力
[regulation_number_of_strokes, number_of_strokes].transpose.each do |regulation_number_of_stroke, number_of_stroke|
  if number_of_stroke - regulation_number_of_stroke >= 2
    comprehensive_judgements << "#{number_of_stroke - regulation_number_of_stroke}ボギー"
  elsif number_of_stroke - regulation_number_of_stroke == 1
    comprehensive_judgements << 'ボギー'
  elsif (number_of_stroke - regulation_number_of_stroke).zero? && (regulation_number_of_stroke >= 2 && number_of_stroke >= 2)
    comprehensive_judgements << 'パー'
  elsif number_of_stroke - regulation_number_of_stroke == -1
    comprehensive_judgements << 'バーディ'
  elsif number_of_stroke - regulation_number_of_stroke == -2 && (regulation_number_of_stroke >= 3 && number_of_stroke >= 2)
    comprehensive_judgements << 'イーグル'
  elsif number_of_stroke - regulation_number_of_stroke == -3 && (regulation_number_of_stroke == 5 && number_of_stroke == 2)
    comprehensive_judgements << 'アルバトロス'
  elsif number_of_stroke - regulation_number_of_stroke == -4 && (regulation_number_of_stroke == 5 && number_of_stroke == 1)
    comprehensive_judgements << 'コンドル'
  elsif  regulation_number_of_stroke >= 3 && number_of_stroke == 1
    comprehensive_judgements << 'ホールインワン'
  end
end
puts comprehensive_judgements.join(',')

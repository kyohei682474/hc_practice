require 'optparse'
require 'date'

# コマンドの解析
opt = OptionParser.new
options = {}
opt.on('-m [mon]', Integer) { |mon| options[:m] = mon }
opt.parse!(ARGV)
p ARGV

now = Date.today
year = Date.today.year

mon = options[:m] || now.month

if mon < 1 || 12 < mon
  puts "#{mon} is neither a month number (1..12) nor a name"
end


weeks = ["日","月","火","水","木","金","土",]
# %m: 月を表す数字(01-12)　%Y: 西暦を表す数
top = Date.today.strftime("%m, %Y")
# year = Date.today.year
# mon = Date.today.month
# 初日が何曜日かを把握
first_wday = Date.new(year, mon, 1).wday
# 最終日が何日か把握
last_date = Date.new(year, mon, -1).day

puts top.center(20)
puts weeks.join(' ')
print " " * (first_wday * 3)
(1..last_date).each do |date|
  print date.to_s.rjust(2) + " " 
  if (date + first_wday) % 7 == 0 
    print "\n"
  else
    date += 1
  end
end





# date = Date.new(2024, 06, 21)
# p date
# opt = OptionParser.new

# opt.on('-m VAL') {|v| p v }
# opt.on('-b') {|v| p v }

# opt.parse!(ARGV)
# p ARGV
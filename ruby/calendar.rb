

require 'date'
require 'optparse'

def calender(year, mon)
  header_top = "#{mon}月 #{year}" 
  first_wday = Date.new(year, mon, 1).wday
  last_date = Date.new(year, mon, -1).day

  puts header_top.center(20)
  puts "日 月 火 水 木 金 土"
  print " " * (first_wday * 3)
  (1..last_date).each do |date|
    print "#{date.to_s.rjust(2)} "
    # if (date + first_wday) % 7 == 0
    if ((date + first_wday) % 7).zero?
      print "\n"
    else
      date + 1
    end
  end
end

opt = OptionParser.new
options = {}
opt.on('-m mon', Integer) { |mon| options[:m] = mon }
opt.parse!(ARGV)

now = Date.today
year = Date.today.year

 # オプションをカレンダーに組み込む
mon = options[:m] || now.month
if mon < 1 || 12 < mon # rubocop:disable Style/YodaCondition
  puts "#{mon} is neither a month number (1..12) nor a name"
  exit
end

calender(year, mon) # rubocop:disable Layout/TrailingEmptyLines
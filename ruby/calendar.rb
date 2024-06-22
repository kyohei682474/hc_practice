require 'optparse'
require 'date'

class Calendar
  Date.new
end

date = Date.new(2024, 06, 21)
p date
opt = OptionParser.new

opt.on('-m VAL') {|v| p v }
opt.on('-b') {|v| p v }

opt.parse!(ARGV)
p ARGV



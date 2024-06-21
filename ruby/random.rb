groups = ['A', 'B','C', 'D','E','F']
numbers = [1, 2]
number =  numbers.sample(1)
if number == [1]
  p divides_first = groups.sample(3).sort
  p groups - divides_first

elsif number == [2]
  p divides_first = groups.sample(2).sort
  p groups - divides_first
end
  

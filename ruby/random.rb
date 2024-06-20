groups = ['A', 'B' ,'C' ,'D' ,'E' ,'F']
numbers = [1, 2]
number =  numbers.sample(1)
if number == [1]
  p divides_first = groups.sample(3).sort
  p groups - divides_first

elsif number == [2]
  p divides_first = groups.sample(2).sort
  p groups - divides_first
end

# class Group
#   groups = ['A', 'B' ,'C' ,'D' ,'E' ,'F']
#   def divides_even
#     p divides_first = groups.sample(3).sort
#     p groups - divides_first
#   end
#   def divides_uneven
#     p divides_first = groups.sample(2).sort
#     p groups - divides_first
#   end
# end

# numbers = [1, 2]
# number =  numbers.sample(1)
# group = Group.new
#  number == [1] ? group.divides_even : group.divides_uneven




# groups = ['A', 'B' ,'C' ,'D' ,'E' ,'F']
# numbers = [1, 2]

# number =  numbers.sample(1)
# if number == [1]
#   p divides_first = groups.sample(3).sort
#   p groups - divides_first

# elsif number == [2]
#   p divides_first = groups.sample(2).sort
#   p groups - divides_first
# end
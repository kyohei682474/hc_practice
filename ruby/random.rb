groups = ['A', 'B','C','D','E','F']
numbers = [2, 3]
number = numbers.sample
p divides_first = groups.sample(number).sort
p groups - divides_first

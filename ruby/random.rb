

groups = ["A","B","C","D","E","F"]
numbers  = [2,3]
number =  numbers.sample(1)
  if number == [2]
    p divides_first = groups.sample(3).sort
    p divides_second = groups - divides_first

  else number == [3]
    p divides_first = groups.sample(2).sort
    p divides_second = groups - divides_first
  end


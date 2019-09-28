
def natural_sum(x)
  raise ArgumentError, "You must call this with a natural number." if x < 0

  return x if x < 2

  return x + natural_sum(x - 1)
end

def natural_sum_iterative(x)
  raise ArgumentError, "You must call this with a natural number." if x < 0

  num = 0
  sum = 0
  while num <= x
    sum += num
    num += 1
  end

  return sum
end
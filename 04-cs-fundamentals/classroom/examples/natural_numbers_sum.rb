def natural_numbers_sum(num)
  if num == 1 || num == 0
    return num
  end
  return num + natural_numbers_sum(num - 1)
end


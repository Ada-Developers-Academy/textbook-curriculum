
def missing_numbers_in_range(array, low, high)
  return [] if array == nil ||
               array.length == 0 ||
               low > high

  hash = {}
  array.each do |element|
    hash[element] = true
  end

  result = []
  (low..high).each do |number|
    if hash[number].nil?
      result << number
    end
  end

  return result
end

puts "#{missing_numbers_in_range([10, 12, 11, 15], 10, 15)}"

puts "#{missing_numbers_in_range([1, 14, 11, 51, 15], 50, 55)}"

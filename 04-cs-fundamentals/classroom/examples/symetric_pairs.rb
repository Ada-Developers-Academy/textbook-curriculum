
def symetric_pairs(array_of_pairs)
  hash = {}
  result = []

  array_of_pairs.each do |pair|
    hash[pair[0]] = pair[1]
  end

  hash.each do |key, value|
    if hash[value] == key
      result << [key, value]
      hash[key] = nil # prevent duplicates
    end
  end

  return result
end

puts "#{symetric_pairs([[11, 20], [30, 40], [5, 10], [40, 30], [10, 5]])}"

puts "#{symetric_pairs([["Dan", "Dee"], ["Lisa", "Val"], ["Kaida", "Chris"], ["Devin", "Susan"], ["Christine", "Jane"]])}"
puts "#{symetric_pairs([["Dan", "Dee"], ["Dee", "Dan"], ["Kaida", "Chris"], ["Devin", "Susan"], ["Devin", "Jane"]])}"

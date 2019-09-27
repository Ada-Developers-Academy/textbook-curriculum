def frequency_sort(s)
  counts = s.chars.reduce(Hash.new(0)) do |hash, character|
    hash[character] += 1
    hash
  end

  max_count = 0

  letter_strings = Hash.new("")
  counts.each do |letter, count|
    letter_strings[count] += letter * count
    max_count = max_count > count ? max_count : count
  end

  return max_count.downto(1).reduce("") do |string, num|
    if letter_strings[num]
      string + letter_strings[num]
    else
      string
    end
  end
end

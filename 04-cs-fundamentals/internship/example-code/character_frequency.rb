def frequency_sort(s)
  counts = s.chars.reduce( Hash.new(0) ) do | hash, character|
    hash[character] += 1
    hash
  end
    
  max_count = 0
    
  letter_strings = {}
  counts.each do |letter, count|
    letter_strings[count] ||= ""
    letter_strings[count] << letter * count
    max_count = count if count > max_count
  end
  
  answer = max_count.downto(1).reduce("") do |string, num|
    unless letter_strings[num].nil? 
      string << letter_strings[num]
    end
    string
  end

  return answer
end
def coffee_price is_iced, size, flavor_array
  price = 2.50

  if size == 0
  elsif size == 1
    price += 1
  else
    price *= 2
  end

  if is_iced
    price += 0.75
  end

  flavor_array.each do |flavor|
    puts "pumping #{flavor}"
    price += 0.50
  end

  price
end

puts coffee_price true, 3, ["vanilla", "lemon"]


# Ruby to JavaScript Worksheet
Read the code in each section, then write the equivalent JavaScript code for the Ruby that is given. Start by writing it out in a text editor or on a piece of paper. Then try running it and tweak your code until it successfully runs with expected output.

Each problem stands alone. Variables from previous problems do not exist.

## Problem Set
1.
```ruby
person_age = 55
ada_age = 2

if person_age < ada_age
   print "This person is younger"
elsif ada_age < person_age
   print "Ada is younger"
else
   print "They’re the same!"
end
```

2.
```ruby
pet = "cat"
food = "ice cream"

if pet == "cat"
   print "here kitty"
elsif pet == "dog"
   print "woof"
else
   print "some other sound"
end

if food == "broccoli"
   print "eh."
elsif food == "ice cream"
   print "yum"
end
```

3.
```ruby
x = 7
y = 7

if x > y || x == y
   if x > y
      print "x is bigger"
   else
      print "x = y"
   end
else
   print "y is bigger"
end
```

4.
```ruby
2.times do
  puts "dance"
end
```

5.
```ruby
10.times do |i|
  puts i
end
```

6.
```ruby
3.times do
  puts "coding!"
end
puts "fun!"
```

7.
```ruby
5.times do |x|
  puts "#{x} chicken(s)"
end
```

8.
```ruby
10.times do |i|
  puts i * i
end

```

9.
```ruby
(1..5).each do
  puts "hello!"
end
```

10.
```ruby
(1..3).each do |i|
  puts "#{i} animals(s)"
end
```

11.
```ruby
(1..3).each do |i|
  puts i * i
end
```

12.
```ruby
total = 0

(1..3).each do |i|
  total = total + i
end

puts total
```

13.
```ruby
(1..10).each do |x|
  if x == 5
    puts "You got a winner!"
  end
end
```

14.
```ruby
i = 0

while i < 3
  puts “hi”
  i = i + 1
end
```

15.
```ruby
i = 0

while i < 3
  puts “hi”
  i = i + 1
end

puts "bye"
```

16.
```ruby
i = 0

while i < 3
  i += 1
  puts i
end
```

17.
```ruby
x = 5
i = 0

while i < 3
  x = x + 1
  i = i + 1
end

puts x
```

18.
```ruby
i = 3

while i > 0
  puts "ada!"
  i = i - 1
end
```


19.
```ruby
cars = ["old", "new", "used"]
cars.each do |car|
  puts car
end
```

20.
```ruby
fruits = ["banana", "apple", "kiwi"]
fruits.each do |fruit|
  puts "I love " + fruit + "!"
end
```

21.
```ruby
total = 0
values = [4, 6, 2, 8, 11]

values.each do |value|
    total = total + value
end

puts total
```

22.
```ruby
values = [8, 5, 3, 10, 14, 2]
values.each do |value|
  if value == 10
    puts "Special case!"
  else
    puts "Regular values like #{value}"
  end
end
```

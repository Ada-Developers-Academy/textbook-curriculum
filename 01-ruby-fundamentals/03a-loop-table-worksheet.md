#Loop Table Worksheet

##Complete the following loop tables by filling in the values for each iteration of the loop.


```ruby
[2,5,8,11,14].each do |x|
  puts 2x + 7
end
```

|  Loop  |   x   |  Output  |
| ------ | ----- | -------- |


___


```ruby
["kittens", "meerkats", "red pandas"].each do |critter|
  affirmation = "I am as amazing as " + critter + "!"
  puts affirmation
end
```

| Loop |   Critter   |          Output            |
| ---- | ----------- | -------------------------- |


___


```ruby
a = ["m", "p", "e", "u", "o", "r", "w", "r"]
s1 = ""
s2 = ""

a.each do |letter|
  if (a.index(letter))%2==0
    s1=s1+letter
    puts s1
  else
    s2=s2+letter
    puts s2
  end
end
```

| Loop |    Letter    |    s1     |    s2     |    Output    |
| ---- | ------------ | --------- | --------- | ------------ |


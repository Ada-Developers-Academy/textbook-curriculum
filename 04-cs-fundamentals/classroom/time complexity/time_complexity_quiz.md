# Time Complexity Quiz

Read the code or problem statement in each section and determine the time complexity for each code snippet or solution to the problem statements in Big O terms.
Explain your answer.


## Problem Set
1.
```ruby
  def value_exists?(test_array, value)
    test_array.each do |item|
      if item == value
        return true
      end
    end

    return false
  end
```

2.
```ruby
  def method_repeat_four(value)
    4.times do
      puts "The value is #{value}."
    end
    return value
  end
```

3.
```ruby
  def method_repeat_multiple(value, multiple)
    multiple.times do
      puts "The value is #{value}."
    end
    return value
  end
```

4.
```ruby
  def method_one(test_array)
    test_array.length.times do |i|
      puts "Hello, Friend #{i + 1}!"
    end
  end
```

5.
```ruby
  def method_two(test_array)
    count = test_array.length
    i = 0
    while i < 17
      puts "Hello, Friend #{i+1}!"
      i += 1
    end
  end
```

6.
```ruby
  def method_three(test_array)
    count = test_array.length
    i = 0
    while i < count
      puts "Hello, Friend #{i+1}!"
      i += 1
    end
  end
```

7.
```ruby
  def method_four(test_array)
    count = test_array.length
    i = 0
    while i < 17
      count.times do |j|
        puts "Hello, Friend #{i+1} in #{j+1}!"
      end
      i += 1
    end
  end
```

8.
```ruby
  def method_five(test_array)
    count = test_array.length
    i = 0
    while i < count
      count.times do |j|
        puts "Hello, Friend #{i+1} in #{j+1}!"
      end
      i += 1
    end
  end
```

9.
```ruby
  def method_six(test_array)
    count = test_array.length
    k = 0
    until k == count
      i = 0
      while i < count
        count.times do |j|
          puts "Hello, Friend #{i+1} in #{j+1}!"
        end
        i += 1
      end
      k += 1
     end
  end
```

10.
```ruby
  def method_seven(test_array, value)
    low = 0
    high = test_array.length - 1
    while low <= high
      mid = (low + high)/2
      if (test_array[mid] > value
        high = mid - 1
      elsif test_array[mid] < value
        low = mid + 1
      else
        return mid
      end
    end
    
    if test_array[low] == value
      return low
    end
    
    return nil
  end
```

## Advanced quiz problems

11. Problem statement: Given a password of length _n_ which can contain only digit values.
What will be the time complexity for a brute force solution to break the password?

12. Problem statement: A traveling salesperson wants to visit _n_ cities. They can start the journey at any city and must visit each city once. How many different possibilities exist of the order in which they could visit all the _n_ cities?

Compare your answers to the [solutions](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/04-cs-fundamentals/classroom/time%20complexity/time_complexity_quiz_solutions.md). Slack any questions or comments to your CS Fundamentals' instructor.


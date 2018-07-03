# Solutions to Time Complexity Quiz

The following provides solutions for [Time Complexity Quiz](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/04-cs-fundamentals/classroom/time%20complexity/time_complexity_quiz.md) Please attempt the quiz on your own before reading the solutions' file. Slack your CS Fundamentals' Instructor for getting any questions clarified.


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
**Solution & explanation**: The provided code _linearly_ searches through each item in the array to check if the value is found. In the worst case scenario, all items in the array are searched. This means if there are _n_ items in the array, all _n_ items will be checked. In the best case scenario, the value to be found would be the first item in the array. In the average cases, the number of times the loop will run will be somewhere in between best case and worst case but still dependent on the number of items in the array i.e. _n_.

The time complexity of this algorithm is therefore _linear_ or _O(n)_ where _n_ is the length of the test_array.

2.
```ruby
  def method_repeat_four(value)
    4.times do
      puts "The value is #{value}."
    end
    return value
  end
```
**Solution & explanation**: Independent of the input parameter value, the loop in this method will always run four times. Because the number of iterations in the loop is constant and independent of input parameter size or value, the time complexity will be _constant_ or _O(1)_.

3.
```ruby
  def method_repeat_multiple(value, multiple)
    multiple.times do
      puts "The value is #{value}."
    end
    return value
  end
```
**Solution & explanation**: This method executes the _puts_ instruction multiple number of times. If the value of multiple changes, the number of times the _puts_ instruction is repeated will change _linearly_.

Therefore, the time complexity of this algorithm is _linear_ or _O(n)_ where _n_ is multiple.

4.
```ruby
  def method_one(test_array)
    test_array.length.times do |i|
      puts "Hello, Friend #{i + 1}!"
    end
  end
```
**Solution & explanation**: This method will execute the _puts_ statement as many times as is the length of the test_array. If the size of the test_array changes, the number of times the _puts_ statement gets executed will change to match the size.

Since the number of times the _puts_ statement gets executed is _linearly_ proportional to the length of the test_array, the time complexity is _linear_ or _O(n)_ where _n_ is the length of the test_array.

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
**Solution & explanation**: The loop in this method gets run 17 times regardless of the size or value of the input array.

Hence, the time complexity of _constant_ or _O(1)_.

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
**Solution & explanation**: The loop in this method gets run _count_ number of times. _count_ is the length of the input test_array. As the length of the input test_array changes, so will the number of times the loop gets executed. The execution of the loop is _linearly_ proportional to the length of the input test_array.

So, the time complexity is _linear_ or _O(n)_ where n is the length of the input parameter, test_array.

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
**Solution & explanation**: There are two nested loops in this method. The outer _while_ loop gets run 17 times. The inner, times loop gets run count number of times where count is the length of the input test_array. Since the loops are nested, for each iteration of the outer loop, the complete inner loop gets run once. That means, the puts statement will get executed (17 X count) number of times.

In Big O terms, the puts statement will get executed _(17 X n)_ number of times, where _n_ is the length of the input test_array. While determining time complexity, we drop the constants. So, the time compelxity of this algorithm is _O(n)_, where n is the length of the input test_array. In other words, the time complexity is linearly proportional to the input size.

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
**Solution & explanation**: There are two nested loops in this method. Each loop runs _n_ number of times where _n_ is the length of the input test_array. Since the loops are nested, the loop will run _n X n_ number of times.

So, the times complexity of this algorithm is _O(n ^ 2)_ where _n_ is the length of the input test_array. In other words, the time complexity is _quadratic_, which is a _polynomial_ time complexity.

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
**Solution & explanation**: There are three nested loops in this method, each running _n_ times where _n_ is the length of the input test_array. The time complexity will therefore be _n X n x n_ or in Big O terms _O(n ^ 3)_. In other words, the time complexity will be _cubic_, which is a _polynomial_ time complexity.

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
**Solution & explanation**: There is one loop in this method. The loop is run proportional to the length of the input test_array. With each iteration through the loop, half of the items in the test_array are eliminated (either first half or second half) until either the value is found or the loop ends. Since with each iteration through the loop half of the values in the remaining sub-array are eliminated, the time complexity of this algorithm is _logarithmic_ or _O(log n)_ where _n_ is the length of the input parameter, test_array.

## Advanced quiz problems

11. Problem statement: Given a password of length _n_ which can contain only digit values.
What will be the time complexity for a brute force solution to break the password?
**Solution & explanation**: To break the password of size _n_ where each value could be one of ten, 0-9 digits, we will need to try out each possibility starting with all n values being _0_. Then change one of the values to remaining 9 possibilities. For each of these, change another value to each of the remaining possibilities and so on. 

The first of the n values could be any of 0 through 9. For each of these, we try the 10 possible values for the second of the n values and so on. This would lead to _10 X 10 X ... n times_ or in other words _10 ^ n_ possibilities to explore. Hence the time complexity will be _O(10 ^ n)_ or _exponential_.

12. Problem statement: A traveling salesperson wants to visit _n_ cities. They can start the journey at any city and must visit each city once. How many different possibilities exist of the order in which they could visit all the _n_ cities?
**Solution & explanation**: We start with choosing one of the _n_ cities to be the starting cities. There _n_ possible options for this. For each such choice of first cities, the are _n - 1_ options to select the second city to visit. Then, _n - 2_ options to select the third city to vist and so on until only one city remains to visit.

Let's consider an example: Let's say _n_ is 3 and the possible cities are Alaska, Boston and Chicago. Intuitively, here's how we can explore the problem. We pick one of the three cities to be the first city. Let's say Alaska. Then, for the next city to visit, there are two options, Boston or Chicago. Let's say we pick Boston then only one city remains unvisited i.e. Chicago. To try out all possible such options would look like to following:
Alaska  -> Boston -> Chicago
Alaska -> Chicago -> Boston
Boston -> Alaska -> Chicago
Boston -> Chicago -> Alaska
Chicago -> Alaska -> Boston
Chicago -> Boston -> Alaska
This is a total of 6 possibilities, which is the same as _3 X 2 X 1_ or _3!_ i.e. _3 factorial_

Generalizing to _n_ cities, this would be _n X (n-1) X (n-2) X ... X 1_ or _n!_ i.e. _n factorial_. In Big O terms, the time complexity will be _O(n!)_ or _factorial_.



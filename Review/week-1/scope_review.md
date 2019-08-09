## Lessons and Exercises
- [Scope](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/01-ruby-fundamentals/scope.md)

## Warm-up Exercise

Review the code below. What do you notice? What do you wonder?

### Check for understanding
1. What is the method name?
2. When do we call the method?
3. What are the method parameters?
4. What is the method's return value? What is the data type of this return value?
5. What happens if we uncomment #1?
6. What happens if we uncomment #2?
7. What is the output of #3?
8. What is the output of #4?

```ruby

# find the equation of a line given two points
def find_line_equation_(x1, y1, x2, y2)

  # -- 1 -- 
  # puts "The slope is #{m}."
  # puts "The y-intercept is #{b}."

  # -- 2 -- 
  # puts "The equation of the line through point (#{x1},#{y1}) and (#{x2},#{y2}) is: "
  
  
  if x2 != x1
    m = (y2-y1)/(x2-x1)
    b = y1 - m*x2
  else
    vertical = true
  end

  # -- 3 -- 
  if m == 0
    puts "y = #{y1}"
  elsif vertical == true
    puts "x = #{x1}"
  elsif b < 0
    puts "y = #{m}x - #{-1*b}"
  elsif b == 0
    puts "y = #{m}x"
  else 
    puts "y = #{m}x + #{b}"
  end

  return {slope: m, y_intercept: b}
end

result = equation(2, 4, 3, 5)

# -- 4 --
# puts "The slope is #{result[:slope]}."
# puts "The y-intercept is #{result[:y_intercept]}."

```


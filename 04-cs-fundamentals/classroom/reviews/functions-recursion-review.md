# How Functions Work Review

## Review Questions

1.  In English explain how parameters are passed to a method in Ruby?
2.  What will the following print?

```ruby
def some_method(list)
  list << 5
end

list = [3, 4, 7]
some_method(list)
puts "#{list}"
```

3. What will the following print?

```ruby
def some_method(x)
  x = 25
end

y = 10
some_method(y)
puts "#{y}" 
```

4. Explain the purpose of the call stack?
   1. How is that related to a Stack Trace?
   2. Where does stack overflow come from?
5. Explain in English the term _recursion_.
   1.  What is a _base case_?
   2.  What is a _recursive case_?
6.  In the following method identify the _base case_ and _recursive case_.

```ruby
def mystery(x)
  if x <= 0
    return
  end

  puts x
  mystery(x/2)
end
```

7.  What is wrong with this?
  
```ruby
def natural_numbers_sum(num)
  return num + natural_numbers_sum(num - 1)
end
```

8.  Explain _tail recursion_.
# Recursion Review

Answer the following questions:

1.  What is the System Stack?
    1.  Why is it important with Recursion?
    1.  How does the call stack impact space complexity?
2.  Explain the term _base case_.
3.  Explain the term _recursive case_.
4.  What will the following method return?

```ruby
def mystery(x)
  return 0 if x == 0
  
  return 2 + mystery(x - 1)
end

mystery(7)
```

5.  What is the time complexity of `mystery`?
6.  What is the space complexity of `mystery`?

# While Loop Evaluation Worksheet
For this exercise, you will be evaluating some Ruby code and coming up with scenarios for how the code will execute.

1. For the code below, describe what the loop will do with the following `word` variable assignment. Be sure to include how many times the loop will execute.
  - `word = "ham"`  
  - `word = "hamster"`  
  - `word = "bananas"`  

  ```ruby
  while word.length > 7
    puts "Please enter a word less than or equal to 7 characters."
    word = gets.chomp
  end
  ```

1. For the code below, how many times will the block of the loop execute with the following `word` variable assignments? What is the final value for the `i` variable for each?
  - `word = "ham"`  
  - `word = "hamster"`  
  - `word = "harmonious"`  

  ```ruby
  i = 0
  while i < word.length
    puts word[i]
    i += 3
  end
  ```

1. For the code below, describe the condition where the loop will terminate.
  ```ruby
  time = 0
  timer = true

  while timer
    time += 1
  end
  ```

1. For the code below, write out what the value of `continue` and `i` will be for each iteration of the loop.
  ```ruby
  i = 0
  continue = true

  while continue && (i < 10)
    if i == 3
      continue = false
    end

    i += 1
  end
  ```

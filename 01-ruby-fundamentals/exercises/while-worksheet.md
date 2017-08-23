# While Loop Evaluation Worksheet
For this exercise, you will be evaluating some Ruby code and coming up with scenarios for how the code will execute.

1. For the code below, describe what the code will do with the following inputs:
  1. "ham"
  2. "hamster"
  3. "bananas"

  ```ruby
  puts "Please enter a scrabble word."
  puts "Note: this word must be less than or equal to 7 characters."

  word = gets.chomp
  while word > 7
    puts "Please enter a word less than or equal to 7 characters."
    word = gets.chomp
  end
  ```

1. For the code below, how many times will the block of the loop execute with the following inputs for the `word` variable:
  1. "ham"
  2. "hamster"
  3. "harmonious"

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

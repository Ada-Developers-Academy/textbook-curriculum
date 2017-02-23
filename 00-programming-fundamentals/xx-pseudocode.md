# How to Pseudocode

As our programs become more complicated, it is harder to know where to get started, break down the steps that need to be done and and still write clean code.

By breaking down the problem before writing code we can better prioritize what needs to be done and the steps involved to arrive at the minium of what's needed to solve the problem.


## What is Pseudocode?
It allows you to think through the logic of a solving a problem before implementing 'real' code. So you don't have to think about the exact coding language syntax until you have thought through the problem.

 Pseudocode uses the structural conventions of a programming language, but is intended for human reading rather than machine reading.

**Benefits of Pseudocode:**
- Makes Changes Easier
- Documents Your Work
- Allows for easier code reviews
- Supports Iterative Refinement



## Activity


**Objective** Write a Deaf Grandma program. Whatever you say to grandma (whatever you type in), she should respond with  HUH?!  SPEAK UP, SONNY!, unless you shout it (type in all capitals). If you shout, she can hear you (or at least she thinks so) and yells back, NO, NOT SINCE 1938! The conversation will continue until


- **Step One:** Identify Expected Inputs and Outputs
  - **Input**
    - What we are saying to grandma, as a string
    - Examples: "Hi grandma!", "BYE", "HAVE YOU SEEN THE NEWS?"
  - **Outputs**
    -  To exit the loop if given string: "BYE"
    -  The string: "HUH!? SPEAK UP, SONNY!" if given a random string that is not in all uppercase
    -  The string: "NO, NOT SINCE 1938!" if given a random string in all uppercase
- **Step Two:** Identify and breakdown steps needed to get expected output from input, with pseudocode.  

### Pseudocode Example

```
 PROGRAM dear_grandma method
     Keep LOOPING to get more input
         Prompt user for input
         Ask what to say to grandma

         IF we said "BYE"
             stop asking for more input and leave
         END

         IF what I just said is too quiet
             grandma responds "HUH!? SPEAK UP, SONNY!"
         ELSE
             grandma responds "NO, NOT SINCE 1938!"
         END

     END
END
```


### Pseudocode Example With Code

```ruby
def dear_grandma

    # Keep LOOPING to get more input
    while true

        # Ask the user what to say to grandma
        puts "What do you want to say to grandma?"
        tell_grandma = gets.chomp

        # IF we said "BYE"
        if tell_grandma == "BYE"
            # stop asking for more input and leave
            break
        # END
        end

        # IF what I just said is too quiet
        if tell_grandma.upcase != tell_grandma
            # grandma responds "HUH!? SPEAK UP, SONNY!"
            puts "HUH!? SPEAK UP, SONNY!"
        # ELSE
        else
            # grandma responds "NO, NOT SINCE 1938!"
            puts "NO, NOT SINCE 1938!"
        # END
        end
    end
end
```

## Exercise: Pseudocode a Problem
Pseudocode the following program. Then, write the code to make the program, based off of your pseudocode. 

### Number Guess Game
**Objective** Make a number guesser game. The game should generate a random number between 1 and 100. A user should be able to keep guessing until they arrive at the correct answer. For every wrong guess, the user should be told if their guess is too high or too low. When the user guesses the correct answer, the user is told they guessed correctly and the program stops.




## Additional Resources
- [Khan Academy Video: Planning with Pseudo-code](https://www.khanacademy.org/computing/computer-programming/programming/good-practices/p/planning-with-pseudo-code)
- [Wikihow: How to Write Pseudocode](http://www.wikihow.com/Write-Pseudocode)

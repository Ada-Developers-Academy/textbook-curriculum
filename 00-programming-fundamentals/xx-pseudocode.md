# Pseudocode

## What is Pseudocode?
It allows you to think through the logic of a solving a problem before implementing 'real' code.

 Pseudocode uses the structural conventions of a programming language, but is intended for human reading rather than machine reading.


- Makes Changes Easier
- Documents Your Work
- Allows for easier code reviews
- Supports Iterative Refinement



## Activity


**Objective** Write a Deaf Grandma program. Whatever you say to grandma (whatever you type in), she should respond with  HUH?!  SPEAK UP, SONNY!, unless you shout it (type in all capitals). If you shout, she can hear you (or at least she thinks so) and yells back, NO, NOT SINCE 1938! The conversation will continue until


- **Step One:** Identify Expected Inputs and Outputs
  - **Input**
    - A string of a sentence we are saying to grandma
    - Examples: "Hi grandma!", "BYE", "HAVE YOU SEEN THE NEWS?"
  - **Outputs**
    -  To exit the loop if given string: "BYE"
    -  The string: "HUH!? SPEAK UP, SONNY!" if given a random string not in all upcase
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


## Additional Resources
- []()
- []()

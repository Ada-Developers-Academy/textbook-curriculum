# Pseudocode

## What is Pseudocode?
It allows you to think through the logic of a solving a problem before worrying about syntax.

- Makes Changes Easier
- Documents Your Work
- Allows for easier code reviews
- Supports Iterative Refinement



## Activity


**Objective** Write a Deaf Grandparent program. Whatever you say to grandparent (whatever you type in), she should respond with  HUH?!  SPEAK UP, SONNY!, unless you shout it (type in all capitals). If you shout, she can hear you (or at least she thinks so) and yells back, NO, NOT SINCE 1938!


- **Step One:** Identify Expected Inputs and Outputs
  - **Input**
    - A string of a sentence we are saying to grandparent
    - Examples: "Hi grandparent!", "BYE", "HAVE YOU SEEN THE NEWS?"
  - **Outputs**
    -  To exit the loop if given string: "BYE"
    -  The string: "HUH!? SPEAK UP, SONNY!" if given a random string not in all upcase
    -  The string: "NO, NOT SINCE 1938!" if given a random string in all uppercase

### Pseudocode Example

```

 PROGRAM dear_grandparent method
     Keep LOOPING to get more input
         Prompt user for input
         Ask what to say to grandparent

         IF we said "BYE"
             stop asking for more input and leave
         END

         IF what I just said is too quiet
             grandparent responds "HUH!? SPEAK UP, SONNY!"
         ELSE
             grandparent responds "NO, NOT SINCE 1938!"
         END

     END
END
```


### Pseudocode Example With Code

```ruby
def dear_grandparent

    # Keep LOOPING to get more input
    while true

        # Ask the user what to say to grandparent
        puts "What do you want to say to grandparent?"
        tell_grandparent = gets.chomp

        # IF we said "BYE"
        if tell_grandparent == "BYE"
            # stop asking for more input and leave
            break
        # END
        end

        # IF what I just said is too quiet
        if tell_grandparent.upcase != tell_grandparent
            # grandparent responds "HUH!? SPEAK UP, SONNY!"
            puts "HUH!? SPEAK UP, SONNY!"
        # ELSE
        else
            # grandparent responds "NO, NOT SINCE 1938!"
            puts "NO, NOT SINCE 1938!"
        # END
        end
    end
end
```

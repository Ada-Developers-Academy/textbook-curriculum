# Pyramid Method

This exercise will be good for you if you want more practice with:
- creating a method
- passing values as parameters
- constructing dynamic ASCII responses


## Wave 1
Write a method that accepts a single parameter, an Integer that creates an octothorpe (`#`) pyramid. The parameter determines the width (in octothorpes) of the **bottom tier** of the pyramid.

#### Example input 1
```ruby
pyramid(7)
```

#### Expected output 1
```
   #
  ###
 #####
#######
```

#### Example input 2
```ruby
pyramid(6)
```

#### Expected output 2
```
  ##
 ####
######
```

## Wave 2
Extend the method code you wrote in Wave 1 to handle user input. Use `gets.chomp` to receive the input from the user. Write a method called `validate` which will accept the user input as a parameter, and return `true` or `false`, depending on whether or not it is valid input.

#### Example run
```
Enter your pyramid size: ABCED
Sorry! That is not a valid input.

Enter your pyramid size: 4
Your pyramid:
 ##
####
```

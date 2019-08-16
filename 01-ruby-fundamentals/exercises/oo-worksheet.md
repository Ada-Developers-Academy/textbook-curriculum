# Defining Classes Worksheet

Complete this exercise in your text editor.

## Superhero

Define a class that represents the state and behavior of a superhero, named `Superhero` by following these steps.

1. Make a new file named `superhero.rb`. In this file, we are going to define the `Superhero` class.
1. First, start the class definition with
    ```ruby
    class Superhero

    end
    ```
2. Let's verify that you can create specific _instances_ of the `Superhero` class that use your `Superhero` class definition. Make a new file named `main.rb`. This file is going to _use_ the `Superhero` class. Paste in the following code into `main.rb`:
    ```ruby
    require_relative "superhero"

    ms_marvel = Superhero.new
    puts "I have a new instance of Superhero, kept in a variable named ms_marvel, and its value is #{ms_marvel}"
    puts "Even on the next line of code, that hasn't changed! This instance of Superhero is still the same, because we have the same memory address: #{ms_marvel}"
    ```
    Run this file with `$ ruby main.rb` and verify that you don't see any errors.
3. Every superhero should be given a superhero name at the time that it's instantiated. We want to pass in an argument when we make the Superhero. Change `main.rb` to the following:
    ```ruby
    require_relative "superhero"

    ms_marvel = Superhero.new("Ms. Marvel")
    puts "I have a new instance of Superhero, kept in a variable named ms_marvel, and its value is #{ms_marvel}"
    puts "Even on the next line of code, that hasn't changed! This instance of Superhero is still the same, because we have the same memory address: #{ms_marvel}"
    ```
4. Run `$ ruby main.rb`. We should see `wrong number of arguments (given 1, expected 0) (ArgumentError)`!
5. Update the definition of the Superhero class so it accepts parameters. The syntax for defining a class to accept parameters at the time of class creation is to use the `initialize` method inside of the class definition
    ```ruby
    class Superhero

      def initialize(superhero_name)

      end

    end
    ```
    Here, we are saying that every Superhero needs to accept one argument, which will be called `superhero_name`.
6. We want every superhero to keep track of their superhero name as part of their **state**. To keep track of some data as part of their state, we need to update the class definition to hold an **instance variable.** We can define and modify instance variables any time within a class definition, so we'll do this in the `initialize` method:
    ```ruby
    class Superhero

      def initialize(superhero_name)
        @superhero_name = superhero_name
      end

    end
    ```
    We defined a new instance variable named `@superhero_name`, and assigned its value to the value of the local variable `superhero_name`.
7. Run `$ ruby main.rb`. We should not see any errors! That means our code isn't broken :)
8. Every superhero is able to output (or return) their catchphrase (so they can say cool things before they defeat evil and save the day). We want to define **behavior** for every Superhero. To define behavior, we will create a method inside of the class definition:
    ```ruby
    class Superhero

      def initialize(superhero_name)
        @superhero_name = superhero_name
      end

      def say_cool_speech
        return "My name is #{@superhero_name}, and I'm here to defeat evil!"
      end

    end
    ```
9. Update `main.rb` so it uses our superhero's new behavior:
    ```ruby
    require_relative "superhero"

    ms_marvel = Superhero.new("Ms. Marvel")
    ms_marvels_catchphrase = ms_marvel.say_cool_speech
    puts ms_marvels_catchphrase
    ```
    We should see Ms. Marvel's catchphrase print to the terminal!
10. Let's prove to ourselves that we can make many different instances of the `Superhero` class that are all very different values. Update your `main.rb` to this:
    ```ruby
    require_relative "superhero"

    ms_marvel = Superhero.new("Ms. Marvel")
    batman = Superhero.new("Batman")
    sailor_moon = Superhero.new("Sailor Moon")

    ms_marvels_catchphrase = ms_marvel.say_cool_speech
    batmans_catchphrase = batman.say_cool_speech
    sailor_moons_catchphrase = sailor_moon.say_cool_speech

    puts ms_marvels_catchphrase
    puts batmans_catchphrase
    puts sailor_moons_catchphrase
    ```

With the two files in this state, ask yourself the following questions:
- `ms_marvel` is an instance of what class?
- `batman` is an instance of what class?
- What line of code _instantiates_ an instance of `Superhero` with the name `Ms. Marvel`?
- What line of code _instantiates_ an instance of `Superhero` with the name `Sailor Moon`?
- In the class definition of `Superhero`, what line of code _assigns_ the instance variable `@superhero_name`?
- In the class definition of `Superhero`, what line of code _reads_ the instance variable `@superhero_name`?
- All instances of Superhero can perform the behavior named `say_cool_speech`. How does that get defined?
- All instances of Superhero can perform the behavior named `say_cool_speech`. How does that get called/invoked?

2. Create a `Celsius` class:
  - Should be instantiated with a temperature
  - Should have one method called `to_farenheit` which will convert the original temperature to Farenheit. The formula to convert Celsius to Fahrenheit is the temperature in Celsius times 1.8 plus 32

  The following code should successfully execute once you have completed your `Celsius` class:
  ```ruby
  celly = Celsius.new(10)
  celly.to_farenheit
  => 50
  ```

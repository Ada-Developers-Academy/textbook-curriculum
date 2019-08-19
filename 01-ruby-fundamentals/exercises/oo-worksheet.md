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

## Celsius

Define a class that represents the state and behavior of the temperature unit Celsius, named `Celsius`.

Before we get into code, first let's predict. We want the following to be true about our `Celsius` class:

1. Every instance of `Celsius` should be instantiated with `temperature`. What syntax do we use to define that?
2. Every instance of `Celsius` should keep track of its own temperature. What syntax do we use to define that, and assign it to the temperature we passed in?
3. Every instance of `Celsius` has the behavior of returning its temperature as Fahrenheit. What syntax do we use to define behavior?

<details>

  <summary>Check your answers here</summary>

  1. We define the parameters for a class in its `initialize` method, as part of its method signature. When we create instances of `Celsius`, we pass in the parameters by doing `Celsius.new(temperature)`
  2. We use instance variables (variables inside of classes that start with `@`) to keep track of data/state inside of an instance. We can assign it to the passed in temperature inside the `initialize` method.
  3. We define behavior in a class by making a method inside of it.

</details>

### Let's Begin!

1. Create a file `celsius.rb`
1. Define a class named `Celsius` inside of that file
1. Create a `main.rb` file and paste this in:
    ```ruby
    require_relative "celsius"

    nice_temp = Celsius.new
    ```
    Run it and ensure that the Terminal does not say you have any syntax errors
1. Define the `initialize` method inside of the `Celsius` class definition. Say that it needs one parameter named `temperature`
1. Update `main.rb` to say `nice_temp = Celsius.new(22)` instead. Run the code to verify that there are no syntax errors
1. Inside of the `initialize` method, say that there is an instance variable named `@temperature` and assign it to the passed in temperature by writing this line: `@temperature = temperature`
1. Define a new method named `to_fahrenheit` inside of the `Celsius` class.
1. Update `main.rb` so it has these contents:
    ```ruby
    require_relative "celsius"

    degrees = 22
    nice_temp = Celsius.new( degrees )
    puts "Right now the temperature is #{degrees}°C, or #{ nice_temp.to_fahrenheit}°F"
    ```
    Run `main.rb` to ensure you do not have any syntax errors
1. Finally, implement the `to_fahrenheit` method! The formula to convert Celsius to Fahrenheit is the temperature in Celsius times 1.8 plus 32


<details>

  <summary>
    Compare your answer against ours
  </summary>

  ```ruby
  class Celsius

    def initialize(temperature)
      @temperature = temperature
    end

    def to_fahrenheit
      return ( @temperature * 1.8 ) + 32
    end

  end
  ```
</details>

## Optional: CoffeeOrder

Define a class called `CoffeeOrder` that has a lot of parameters. Maintain the practice of using `main.rb` to catch your syntax errors and practice making and using instances of classes.

1. Define a class called `CoffeeOrder` in a file `coffee_order.rb`
1. Every instance of `CoffeeOrder` should be instantiated with `type`, `size`, `extra_shots`, and `cold`
1. Every instance of `CoffeeOrder` should track using instance variables `type`, `size`, `extra_shots`, and `cold`
1. `CoffeeOrder` should have the behavior `calculate_price`. This method takes in one parameter named `tip_percentage`
1. Read through this code, and inspect how the method parameter `tip_percentage` gets used differently compared to the instance variables. Update your `calculate_price` method to look like this:
    <details>

      <summary>
        Code
      </summary>

      ```ruby
      def calculate_price(tip_percentage)
          case @type
          when :drip
            price = 1.5
          when :latte
            price = 3.7
          when :cappuccino
            price = 3.2
          else
            puts "Invalid coffee type: #{type}"
            return
          end

          case @size
          when :tall
            # No change
          when :grande
            price *= 1.3
          when :venti
            price *= 1.6
          else
            puts "Invalid size: #{size}"
            return
          end

          price += @extra_shots * 0.5

          if @cold
            price += 1
          end

          price *= 1 + tip_percentage

          return price
        end
      ```
    </details>

    <br/>

1. Update `main.rb` to look like this:
  ```ruby
  require_relative "coffee_order"

  my_coffee = CoffeeOrder.new(:drip, :tall, 2, true)

  puts "The price when I type 15% is #{ my_coffee.calculate_price( 0.15 ) }"
  puts "The price when I type 18% is #{ my_coffee.calculate_price( 0.18 ) }"
  puts "The price when I type 20% is #{ my_coffee.calculate_price( 0.20 ) }"
  ```
  Run it and observe that we can still pass in different parameters to these instance methods

## Optional: ProfessionalYeller

Prove to yourself that values of instance variables can be modified within an instance of a class, but instance variables between different instances do not interact.

Read the following pieces of code, and predict the answers to the following questions:

1. Does a `ProfessionalYeller` take in any arguments whenever a new instance is made?
1. What does a `ProfessionalYeller` keep track of as pieces of state (as instance variables)?
1. What does the behavior (instance method) `yell` do?
1. What should we see in the Terminal when we run `main.rb`?

`professional_yeller.rb`
```ruby
class ProfessionalYeller

  def initialize(favorite_phrase)
    @phrase = favorite_phrase
    @count = 1
  end

  def yell
    scream = @phrase * @count
    @count += 1
    return scream
  end

end
```

`main.rb`
```ruby
require_relative "professional_yeller"

yeller_of_a = ProfessionalYeller.new( "A" )
yeller_of_love = ProfessionalYeller.new( "LOVE" )
yeller_of_peace = ProfessionalYeller.new( "PEACE" )

puts yeller_of_a.yell
puts yeller_of_love.yell
puts yeller_of_peace.yell

puts yeller_of_love.yell
puts yeller_of_peace.yell

puts yeller_of_love.yell

puts yeller_of_peace.yell
puts yeller_of_peace.yell
puts yeller_of_peace.yell

puts yeller_of_love.yell
puts yeller_of_peace.yell
puts yeller_of_love.yell

puts yeller_of_a.yell
puts yeller_of_a.yell
puts yeller_of_a.yell
puts yeller_of_a.yell
puts yeller_of_a.yell

```

Copy this code and verify your answers.

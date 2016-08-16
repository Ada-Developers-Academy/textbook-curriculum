# Objects Worksheet

Choose 1 of the following examples to complete. You can do this on paper or in your text editor, whatever you would like.

1. Create a `Penguin` class:
  - Should be instantiated with a name
  - Should be able to _read_ the penguins name but not _write_ it (hint: use one of the `attr`s)
  - Should have one method called `looks` that `return`s 'Fuzzy!'

  The following code should successfully execute once you have completed your `Penguin` class:

  ```ruby
  penny = Penguin.new("Gerri")
  penny.name
  => "Gerri"
  penny.looks
  => "Fuzzy!"
  ```

2. Create a `Celsius` class:
  - Should be instantiated with a temperature
  - Should have one method called `to_farenheit` which will convert the original temperature to Farenheit. The formula to convert Celsius to Fahrenheit is the temperature in Celsius times 1.8 plus 32

  The following code should successfully execute once you have completed your `Celsius` class:
  ```ruby
  celly = Celsius.new(10)
  celly.to_farenheit
  => 50
  ```

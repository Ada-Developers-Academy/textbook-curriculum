# JavaScript Worksheet: Functions
For Part 1, read the code in each section, then write the equivalent JavaScript code for the Ruby that is given. Start by writing it out in a text editor or on a piece of paper. Then try running it and tweak your code until it successfully runs with expected output.
For Part 2, follow the directions for each problem.

**Note:** For each function you create, you should also write the code to call the function.

## Part 1
1. &nbsp;
  ```ruby
  def hello
    puts 'hello!'
  end
  ```

2. &nbsp;
  ```ruby
  def say_num(number)
    puts 'Your number is #{number}.'
  end
  ```

3. &nbsp;
  ```ruby
  def larger_num(first, second)
    if first >= second
      first
    elsif second > first
      second
    end
  end
  ```

4. Re-write #3: If you used a function expression, now write using a declaration, or vice versa.

5. &nbsp;
  ```ruby
  def output(items)
    items.each do |item|
      puts item
    end
  end
  ```


## Part 2
Follow the directions for each problem.
1. Invoke the zombies function.
  ```javascript
  const zombies = function() {
    return "We like to eat people";
  };
  ```

<!-- 1. Call the `square()` method on the `my_calculator` object.
  ```javascript
  const Calculator = function() {
    this.square = function (x) {
      return x * x;
    }
  };
  let my_calculator = new Calculator();
  ``` -->

2. What does the following code print to the console?
  ```javascript
  console.log(function () {
    return "Hey hey hey";
  }());
  ```

3. What does the following code print to the console?
  ```javascript
  const blabbermouth = function() { };
  console.log(blabbermouth.name);
  ```

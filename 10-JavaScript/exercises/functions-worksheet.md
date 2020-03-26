# JavaScript Worksheet: Functions
For Part 1, read the code in each section, then write the equivalent JavaScript code for the Ruby that is given. Start by writing it out in a text editor or on a piece of paper. Then try running it and tweak your code until it successfully runs with expected output.
For Part 2, follow the directions for each problem.

**Note:** For each function you create, you should also write the code to call the function.

## Part 1
1. Ruby
    ```ruby
    def hello
      puts 'hello!'
    end
    ```

    <details>
    <summary>
    Javascript
    </summary>

    ```javascript
    const hello = () => console.log('hello!')

    hello()
    ```

    </details>

2. Ruby
    ```ruby
    def say_num(number)
      puts 'Your number is #{number}.'
    end
    ```

    <details>
    <summary>
    Javascript
    </summary>

    ```javascript
    const sayNum = (number) => console.log(`Your number is ${number}`)
    
    sayNum(5)
    ```
    
    </details>

3. Ruby
    ```ruby
    def larger_num(first, second)
      if first >= second
        first
      elsif second > first
        second
      end
    end
    ```

    <details>
    <summary>
    Javascript
    </summary>

    ```javascript
    const largerNum = (first, second) => {
      if (first >= second) {
        return first
      } else {
        return second
      }
    }

    console.log(largerNum(5,7))
    console.log(largerNum(7,5))
    ```
    
    </details>

4. Ruby
    ```ruby
    def output(items)
      items.each do |item|
        puts item
      end
    end
    ```

    <details>
    <summary>
    Javascript
    </summary>

    ```javascript
    const output = (items) => {
      items.forEach((item) => {
        console.log(item);  
      });
    }

    output([1,2,3])
    ```
    </details>


## Part 2
Follow the directions for each problem.
1. Invoke the zombies function.
    ```javascript
    const zombies = function() {
      return "We like to eat people";
    };
    ```

    <details>
    <summary>
    Solution
    </summary>

    ```javascript
    zombies()
    ```
    
    </details>

<!-- 1. Call the `square()` method on the `my_calculator` object.
  ```javascript
  const Calculator = function() {
    this.square = function(x) {
      return x * x;
    }
  };
  let my_calculator = new Calculator();
  ``` -->

2. What does the following code print to the console?
    ```javascript
    console.log(function() {
      return "Hey hey hey";
    }());
    ```

    <details>
    <summary>
    Output
    </summary>

    ```javascript
    Hey hey hey
    ```
    
    </details>

3. What does the following code print to the console?
    ```javascript
    const blabbermouth = function() { };
    console.log(blabbermouth.name);
    ```

    <details>
    <summary>
    Output
    </summary>

    ```javascript
    blabbermouth
    ```
    
    </details>

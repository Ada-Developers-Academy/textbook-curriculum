# Ruby to JavaScript Worksheet
Read the code in each section, then write the equivalent JavaScript code for the Ruby that is given. Start by writing it out in a text editor or on a piece of paper. Then try running it and tweak your code until it successfully runs with expected output.

Each problem stands alone. Variables from previous problems do not exist.

## Problem Set
1. Ruby
    ```ruby
    ada_age = 2

    if person_age < ada_age
       print "This person is younger"
    elsif ada_age < person_age
       print "Ada is younger"
    else
       print "They’re the same!"
    end
    ```

    <details>
    <summary>
    Javascript
    </summary>

    ```javascript
    const adaAge = 2
    let personAge = 35

    if (personAge < adaAge){
      console.log("This person is younger")
    }
    else if (adaAge < personAge){
      console.log("Ada is younger")
    }
    else{
      console.log("They’re the same!")
    }
    ```

    </details>

1. Ruby
    ```ruby
    x = 7
    y = 7

    if x > y || x == y
       if x > y
          print "x is bigger"
       else
          print "x = y"
       end
    else
       print "y is bigger"
    end
    ```
    <details>
    <summary>
    Javascript
    </summary>

    ```javascript
    let x = 7
    let y = 7

    if (x > y || x == y){
      if (x > y){
        console.log("x is bigger")
      }
      else{
        console.log("x = y")
      }
    }
    else{
      console.log("y is bigger")
    }
    ```

    </details>

1. Ruby
    ```ruby
    10.times do |i|
      puts i * i
    end
    ```
    <details>
    <summary>
    Javascript
    </summary>

    ```javascript

    for (let i = 0; i< 10; i += 1){
      console.log(i*i)
    }
    ```

    </details>

1. Ruby 
    ```ruby
    total = 0

    (1..3).each do |i|
      total = total + i
    end

    puts total
    ```

    <details>
    <summary>
    Javascript
    </summary>

    ```javascript
    let total = 0

    for (let i = 1; i<=3; i+=1){
      total += i
    } 

    console.log(total)
    ```

    </details>

1. Ruby
    ```ruby
    i = 0

    while i < 3
      puts "hi"
      i = i + 1
    end

    puts "bye"
    ```

    <details>
    <summary>
    Javascript
    </summary>

    ```javascript
    let i = 0

    while (i < 3){
      console.log("hi")
      i = i + 1
    }
    console.log("bye")
    ```

    </details>

1. Ruby
    ```ruby
    fruits = ["banana", "apple", "kiwi"]
    fruits.each do |fruit|
      puts "I love #{fruit}!"
    end
    ```

    <details>
    <summary>
    Javascript
    </summary>

    ```javascript
    //for..in
    const fruits = ["banana", "apple", "kiwi"]
    for(const i in fruits){
      console.log(`I love ${fruits[i]}!`)
    }

    //forEach
    const fruits2 = ["banana", "apple", "kiwi"]
    fruits2.forEach(fruit => console.log(`I love ${fruit}!`))
    ```

    </details>

1. Ruby
    ```ruby
    total = 0
    values = [4, 6, 2, 8, 11]

    values.each do |value|
        total = total + value
    end

    puts total
    ```

    <details>
    <summary>
    Javascript
    </summary>

    ```javascript
    //for..in
    let total = 0
    const values = [4, 6, 2, 8, 11]

    for(const i in values){
        total = total + values[i]
    }

    console.log(total)

    //forEach
    let total = 0
    const values = [4, 6, 2, 8, 11]

    values.forEach(value => total += value)
        
    console.log(total)
    ```

    </details>

1. Ruby
    ```ruby
    values = [8, 5, 3, 10, 14, 2]
    values.each do |value|
      if value == 10
        puts "Special case!"
      else
        puts "Regular values like #{value}"
      end
    end
    ```

    <details>
    <summary>
    Javascript
    </summary>

    ```javascript
    const values = [8, 5, 3, 10, 14, 2]

    for(const i in values){
      let value = values[i]
      if (value == 10){
        console.log("Special case!")
      }
      else{
        console.log(`Regular values like ${value}`)
      }
    }
    ```

    </details>

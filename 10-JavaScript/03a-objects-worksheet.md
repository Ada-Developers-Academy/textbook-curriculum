# JavaScript Worksheet: Objects

1. What does the following code print to the console?
```javascript
var pen = {};
pen.ink = 'blue';
console.log(pen.ink);
```

2. What does the following code print to the console?
```javascript
var bottle = {
  contents: function () { return "some fine juice" },
  color: "green"
}
console.log(bottle.contents);
```

3. What would print to the console if the last line of the example above was replaced with the line below?
```javascript
console.log(bottle.contents());
```

4. What does the following code print to the console? What does `this` refer to?
```javascript
var square = {
  side_length: 4,
  area: function () {
    var l = this.side_length;
    return l * l;
  }
}
console.log(square.area());
```

5. What does the following code print to the console?
```javascript
var game = { title: "tic tac toe" };
var same_game = { title: "tic tac toe" };
console.log(game === same_game );
```

6. Add a circumference method to the following circle object that returns the circumference of the circle (Pi equals Math.PI).
```javascript
var circle = {
  radius: 10
}
```

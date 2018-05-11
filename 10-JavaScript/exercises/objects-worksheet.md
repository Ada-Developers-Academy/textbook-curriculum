# JavaScript Worksheet: Objects

1. What does the following code print to the console?
```javascript
let pen = {};
pen.ink = 'blue';
console.log(pen.ink);
```

2. What does the following code print to the console?
```javascript
let bottle = {
  contents: () => "some fine juice",
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
let square = {
  sideLength: 4,
  area: function () {
    let l = this.sideLength;
    return l * l;
  }
}
console.log(square.area());
```

5. What does the following code print to the console?
```javascript
let game = { title: "tic tac toe" };
let sameGame = { title: "tic tac toe" };
console.log(game === sameGame );
```

6. Add a circumference method to the following circle object that returns the circumference of the circle (Pi equals Math.PI).
```javascript
let circle = {
  radius: 10
};
```

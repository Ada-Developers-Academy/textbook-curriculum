//Defining and invoking a function with no arguments

const helloWorld = function() {
  console.log("Hello World")
}

helloWorld()

//Defining and invoking a function with an argument
const saySomething = function(something) {
  console.log(`${something}, said Becca`)
}

saySomething("Hello")

//EDUCATIVE
//Write a function that takes in a number greater than or equal to 0. If the number is greater than 10, round up to the nearest integer. If the number is below 10, round down to the nearest integer. If the number is an integer, don’t round.

/*round(9); // -> 9
round(10); // -> 10
round(11); // -> 11
round(10.1); // -> 11
round(10.88); // -> 11
round(9.9); // -> 9
round(9.1); // -> 9
round(0.1); // -> 0*/

const round = function(num) {
  if (num >= 10){
      return Math.ceil(num)
  } else {
      return Math.floor(num)
  }
}

console.log(round(10))
console.log(round(10.4))
console.log(round(9.4))



//Write a method checkends(s), which takes in a string s and returns true if the first character in s is the same as the last character in s. It returns false otherwise. The checkends(s) method does not have to work on the empty string (the string '').

const checkends = function(s) {
  if (s[0] == s.slice(-1)) {
    return true
  } else {
    return false
  }
}
console.log(checkends('aha'))
console.log(checkends('aha!'))

//checkends refactor
const checkends2 = function(s) {
  return s[0] == s.slice(-1)
}

console.log(checkends2('aha'))
console.log(checkends2('aha!'))

// flipside
// flipside('homework') => workhome
// flipside ('house') => useho
// flipside ('jared') => redja

const flipside = function(s) {
  const n = s.length
  const middle = n/2
  return s.slice(middle,n)+s.slice(0,middle)
}

console.log(flipside('homework'))
console.log(flipside('jared'))

//rock paper scissors
const rps = function(player1, player2) {
  //if there's a tie, return tie
  if (player1 == player2) {
    return "tie"
  }
  //else, implement tie breaking logic
  else {
    // outline the 3 options for player1
    if (player1 == "rock"){
      //conditional for win and lose
      if (player2 == "paper") {
        return "player2"
      } else {
        return "player1"
      }
    } else if (player1 == "paper") {
      //conditional for win and lose
      if (player2 == "scissors") {
        return "player2"
      } else {
        return "player1"
      }
    } else if (player1 == "scissors") {
      //conditional for win and lose
      if (player2 == "rock") {
        return "player2"
      } else {
        return "player1"
      }
    }
  }
}

console.log(rps('rock','paper'))
console.log(rps('rock','rock'))
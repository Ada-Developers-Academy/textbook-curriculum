console.log("\n1.")

const adaAge = 2
let personAge = 35

if (personAge < adaAge) {
  console.log("This person is younger")
}
else if (adaAge < personAge) {
  console.log("Ada is younger")
}
else {
  console.log("They’re the same!")
}

console.log("\n2.")

let x = 7
let y = 7

if (x > y || x == y) {
  if (x > y){
    console.log("x is bigger")
  }
  else {
    console.log("x = y")
  }
}
else {
  console.log("y is bigger")
}

console.log("\n3.")

for (let i = 0; i< 10; i += 1) {
  console.log(i*i)
}

console.log("\n4.")

let total = 0

for (let i = 1; i<=3; i+=1) {
  total += i
} 

console.log(total)

console.log("\n5.")

let i = 0

while (i < 3) {
  console.log("hi")
  i = i + 1
}
console.log("bye")

console.log("\n6.")

//for..in
const fruits = ["banana", "apple", "kiwi"]
for(let i in fruits) {
  console.log(`I love ${fruits[i]}!`)
}

//forEach
const fruits2 = ["banana", "apple", "kiwi"]
fruits2.forEach(fruit => console.log(`I love ${fruit}!`))
  
console.log("\n7.")

let total0 = 0
const values = [4, 6, 2, 8, 11]

for(const i in values) {
    total0 = total0 + values[i]
}

console.log(total0)

console.log("\n8.")

const values2 = [8, 5, 3, 10, 14, 2]
for(const i in values2) {
  let value = values2[i]
  if (value == 10){
    console.log("Special case!")
  }
  else {
    console.log(`Regular values like ${value}`)
  }
}



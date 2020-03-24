console.log("\n1.")

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

console.log("\n2.")

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

console.log("\n3.")

for (let i = 0; i< 10; i += 1){
  console.log(i*i)
}

console.log("\n4.")

let total = 0

for (let i = 1; i<=3; i+=1){
  total += i
} 

console.log(total)

console.log("\n5.")

let i = 0

while (i < 3){
  console.log("hi")
  i = i + 1
}
console.log("bye")

console.log("\n6.")

const fruits = ["banana", "apple", "kiwi"]
fruits.foreach do |fruit|
  puts "I love #{fruit}!"
end

console.log("\n7.")

console.log("\n8.")


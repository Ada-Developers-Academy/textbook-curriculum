# Instantiate the problem object
prob = Problem.new("How much is 1+1?", 2)

# Give the user the question and recieve the answer
puts prob.question
answer = gets.chomp

if (prob.answer_correct?(answer))
  puts "Correct!"
else
  puts "Wrong!"
end

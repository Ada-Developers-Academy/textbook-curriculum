# Load the problem file - must be in the same directory
require './problem'

# Instantiate the problem object
prob = Problem.new("How much is 1+1?", 2)

# Give the user the question and recieve the answer
puts prob.question
answer = gets.chomp

# Check to see if the answer is correct
if (prob.answer_correct?(answer))
  puts "Correct!"
else
  puts "Wrong!"
end

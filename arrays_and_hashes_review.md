#Reviewing Arrays and Hashes

##Assignment

###Describe an array. Give an example of a problem that you might use an array to solve.
An array is an object that can store multiple pieces of information which are accessible by their index (starting at 0). A good use of an array might be to save the contents of a list (grocery list, etc.).

###Describe a Ruby hash. Give an example of a problem that you might use a Ruby hash to solve.
A Ruby hash is an object that can store multiple pieces of data which are key/value pairs. The keys must be unique but the values may be duplicate. A good use of a hash might be to store pieces of an address for a larger address database. e.g. keys could be :street, :city, :state, etc.

###For each of the following, determine if you would use an array, a hash, or a combination of the two to solve the problem. Use your descriptions in #1 and #2 to justify your answer.

####Count the frequency of letters used in a set of text.
I'd use an array of letters that I iterated over and created a hash from: the unique letters (saved as keys) and how many times they appeared (as the values).

####Record attendance for 24 students for one day.
I would probably use an array, but if the per-day attendance was important across multiple days then I'd use a hash where the keys were the day and the values were an array of students in attendance for that particular day.

####Track information for a single student (name, id, and address).
I'd use a hash. Keys would be :name, :id, :address, etc., and values would be the information specific to that student. 

####Track attendance for a cohort at Ada.
If you need to know who attended, not just how many, again, I'd use a hash to track days and attendance per day. Alternatively, I could count names pushed to one array, then make the count of the names a hash value for that day.

####Track deposit and withdrawal amounts from a petty cash fund.
I would create a hash so I could store both values -- of deposits and withdrawals -- in one place. 

####Represent a player's hand in Texas Hold'em Poker.
I'd use an array, with each element being a card. Easy to read as there are not many cards to look through.

####Represent a player's hand in Go Fish.
I'd use a hash, with the distinct card being the key and the number of that type of card they had being the value. You could also just push each card in the hand to a single array, but it wouldn't be as easy to read.

# CS Fundamentals' homeworks
Here's the list of required and optional homeworks pertaining to CS Fundamentals.

## Required Homeworks
Due Date     | Homework
-------------|----------------
Feb 20       | [Essential Mathematics for software engineers](#essential-mathematics)
Feb 20       | [Binary and Memory - Part 1](#binary-and-memory)
Feb 27       | [Binary and Memory - Part 2](#binary-and-memory)
Feb 27       | Submit PR for [Ada-C11/array_equals](https://github.com/Ada-C11/array_equals)
Mar 13, 20   | Submit PR for [Ada-C11/Restricted-Arrays-Part1](https://github.com/Ada-C11/Restricted-Arrays-Part1)
Mar 13       | Watch this [Video: Big O Notation](https://www.youtube.com/watch?v=v4cd1O4zkGw) by Gale Laakmann McDowell
Mar 13       | Solve this [quiz](https://www.khanacademy.org/computing/computer-science/algorithms/asymptotic-notation/e/quiz--comparing-function-growth) by Khan Academy.
Mar 13       | Solve this [quiz](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/04-cs-fundamentals/classroom/time%20complexity/time_complexity_quiz.md).
Mar 20       | Submit PR for [Ada-C11/string_reverse](https://github.com/Ada-C11/string_reverse)
Apr 03       | Submit PR for [Ada-C11/reverse_words](https://github.com/Ada-C11/reverse_words)
Apr 03       | Read and understand [Sorting algorithms](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/04-cs-fundamentals/classroom/Sorting.md)
Apr 03       | Submit PR for [Ada-C11/reverse_sentence](https://github.com/Ada-C11/reverse_sentence)
Apr 03       | Submit PR for [Ada-C11/palindrome_check](https://github.com/Ada-C11/palindrome_check)
Apr 03       | Submit PR for [Ada-C11/integer_palindrome_check](https://github.com/Ada-C11/integer_palindrome_check)
Apr 10       | Understand the code and predict what you should see in the console output. Try it out to confirm. [Understanding Function Calls](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/04-cs-fundamentals/classroom/Understanding%20function%20calls.md#assignments)
Apr 10       | Submit PR for [Ada-C11/factorial](https://github.com/Ada-C11/factorial)
Apr 17       | Submit PR for [Ada-C11/fibonacci](https://github.com/Ada-C11/fibonacci)
Apr 17       | Submit PR for [Ada-C11/array_intersection](https://github.com/Ada-C11/array_intersection)
May 01       | Submit PR for [Ada-C11/matrix_convert_to_zero](https://github.com/Ada-C11/matrix_convert_to_zero)
May 01       | Submit PR for [Ada-C11/matrix_check_sum](https://github.com/Ada-C11/matrix_check_sum)
May 30       | Define terms, practice tracing and deduce the time and space complexities for some <b>recursive</b> problems. [Ada-C11/recursion-tracing](https://github.com/Ada-C11/recursion-tracing). Answer key for reference can be found [here](https://github.com/Ada-C11/recursion-tracing/tree/solutions)

<b>Notes</b>: Dates are subjected to change based on changes to class scheduling due to unexpected cancellations or delays.

## Homework details
### Essential Mathematics
1. Read the notes and complete the practice exercises on [Essential Mathematics for software engineers](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/04-cs-fundamentals/classroom/Essential%20Mathematics.md)

### Binary and Memory
<b>Part 1</b>:
1. Read the notes on [Computer Data Basics](https://docs.google.com/document/d/1g-Dxn1rVTChBs9ZZSOgmohjP_RoWNyPJTE-m_n35aZ0/edit)
1. Read blog post by Vaidehi Joshi on [Bits, Bytes, Building with Binary](https://medium.com/basecs/bits-bytes-building-with-binary-13cb4289aafa)
1. Watch the [Video: Understand how memory addressing works](https://www.youtube.com/watch?v=F0Ri2TpRBBg) by Prof. Abelardo Pardo, University of Sydney

<b> Part 2 </b>
1. Submit PR for [Ada-C11/BinaryAndDecimal](https://github.com/Ada-C11/BinaryAndDecimal)
1. Code: Write a program to print all possible values that can be represented using 4 bits. e.g. 0000, 0001, 0010, 0011, 0100 ... and so on.

<b>Reference from class discussion on data structures</b>:
1. Understand pros and cons of organizing data in different structures. See assignment on [Ada-C11/array_or_hash](https://github.com/Ada-C11/array_or_hash).

### Arrays and efficiency of Algorithms
Assignments are expected to be worked on after the class discussion.
1. Fork, clone and complete the methods in using_restricted_array.rb on [Ada-C11/Restricted-Arrays-Part1](https://github.com/Ada-C11/Restricted-Arrays-Part1). See the readme file for details.
1. Watch this [Video: Big O Notation](https://www.youtube.com/watch?v=v4cd1O4zkGw) by Gale Laakmann McDowell
1. Solve this [quiz](https://www.khanacademy.org/computing/computer-science/algorithms/asymptotic-notation/e/quiz--comparing-function-growth) by Khan Academy.
1. Solve this [quiz](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/04-cs-fundamentals/classroom/time%20complexity/time_complexity_quiz.md).

Here's some good follow up reading after we meet in class:
+ [Big O notation and complexity in Ruby](https://devblast.com/b/big-o-notation-complexity-ruby) by DevBlast
Videos and additional reading material for furthering your learning for curiosity on topics related to what we covered in class:
+ [Big O notation, time and space complexity](https://www.interviewcake.com/article/python/big-o-notation-time-and-space-complexity?) by interview cake
+ [Binary Search](https://www.khanacademy.org/computing/computer-science/algorithms#binary-search) by Khan Academy
+ Read about [Asymptotic Notation](https://www.khanacademy.org/computing/computer-science/algorithms#asymptotic-notation) by Khan Academy.

### Linked Lists

Assignments:
+ Create .rb file and define the Linked List and Node classes keeping object oriented principles in mind. Author methods to add a value, search for a value, count the number of entries and delete a value from the linked list, assuming that the values in each nodes are integers. Be mindful of when the linked list is empty (before adding the first node, after deleting the last node etc.) in your methods.
+ Do the above for a singly linked list and a separate file for a doubly linked list.

Additional resources:
+ Kal academy's material on [Linear Data Structures](https://drive.google.com/open?id=0BxHords9odw3cDhCdGMxcWFVRms)
+ Kal academy's material on [Linked List](https://drive.google.com/open?id=0BxHords9odw3am9SWEtGSkdrRTA)
+ Stanford CS Education Library material on [Linked List basics](http://cslibrary.stanford.edu/103/)
+ Read through and watch videos on [Linked List vs Array](http://www.geeksforgeeks.org/linked-list-vs-array/)

Optional offline problem sets
+ Stanford CS Education Library material on [Linked List Problems](http://cslibrary.stanford.edu/105/)
+ In "Cracking the Coding Interview" book, "Chapter 2: Linked Lists"
+ CareerCup [Linked List Interview Questions](https://www.careercup.com/page?pid=linked-lists-interview-questions)

### Recursion
Recommended homework exercises related to recursion:
1. This content assumes a good understanding of [understand a function call](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/04-cs-fundamentals/classroom/Understanding%20function%20calls.md)
1. Define terms, practice tracing and deduce the time and space complexities for problems in [Ada-C11/recursion-tracing](https://github.com/Ada-C11/recursion-tracing). Answer key for reference can be found [here](https://github.com/Ada-C10/recursion-tracing/tree/solutions)
1. Design and implement recursive algorithms and explain the time and space complexities of your solution for the problems in [Ada-C11/recursion-writing](https://github.com/Ada-C10/recursion-writing). One approach to implementing the solutions can be found [here](https://github.com/Ada-C11/recursion-writing/tree/solution)
1. [Set 1: Practice question for Recursion](http://www.geeksforgeeks.org/practice-questions-for-recursion/)
1. [Set 2: Practice question for Recursion](http://www.geeksforgeeks.org/practice-questions-for-recursion-set-2/)
1. [Set 3: Practice question for Recursion](http://www.geeksforgeeks.org/practice-questions-for-recursion-set-3/)
1. [Set 4: Practice question for Recursion](http://www.geeksforgeeks.org/practice-questions-for-recursion-set-4/)
1. [Set 5: Practice question for Recursion](http://www.geeksforgeeks.org/practice-questions-for-recursion-set-5/)
1. [Set 6: Practice question for Recursion](http://www.geeksforgeeks.org/practice-questions-for-recursion-set-6/)
1. [Set 7: Practice question for Recursion](http://www.geeksforgeeks.org/practice-questions-for-recursion-set-7/)

### Binary Search Trees
1. Create a Binary Search Tree class and define methods. Create one version with recursive methods. Create another version with iterative methods. Explain the time and space complexity of the methods.

### Stacks and Queues
Keeping object oriented design principles in mind, implement the following:
1. Implement a Stack using an array to hold integer data
1. Implement a Stack using a linked list to hold integer data
1. Implement a Queue using an array to hold integer data
1. Implement a Queue using a linked list to hold integer data
1. Add the following functions to each of the above:
    * Empty() which returns true is the data structure is empty, false otherwise
    * Size() which returns the number of items in the data structure
    * Front() which returns the item that would be dequeued next (for Queue)
    * Top() which returns the item that would be popped next  (for Stack)
    * Min() which returns the minimum integer data value in the data structure
    * Max() which returns the maximum integer data value in the data structure
1. Write a function to print all integer values in a binary tree in pre-order traversal iteratively. (Hint: Use a Stack.)
1. Write a function to print all integer values in a binary tree in breadth first traversal iteratively. (Hint: Use a Queue.)
1. Implement a Queue using 2 Stacks. (Note: it may not be possible to achieve constant time complexity for both Enqueue and Dequeue.)
1. Implement a Stack using 2 Queues. (Note: it may not be possible to achieve constant time complexity for both Push and Pop.)

Additional learning content related to Stacks and Queues:
+ Kal academy's material on [Stacks and Queues](https://drive.google.com/open?id=0BxHords9odw3a2V5cVpkNTl2amc)
+ Read about [Method Call Stack](https://drive.google.com/open?id=0BxHords9odw3cG9WM1Y2S0FQWVE)
+ Read about [Stacks](https://simple.wikipedia.org/wiki/Stack_(data_structure)) on Wikipedia
+ Read about [Queues](https://en.wikipedia.org/wiki/Queue_(abstract_data_type)) on Wikipedia
+ CMU lecture notes on [Stacks and Queues](https://www.cs.cmu.edu/~adamchik/15-121/lectures/Stacks%20and%20Queues/Stacks%20and%20Queues.html)
+ Kal academy's problems on [Stacks and Queues](https://drive.google.com/open?id=0BxHords9odw3b2d1ZTJtVkZZTkk)

### Essential concepts
Further essential reading links:
+ Read further on [Wikipedia: Memory Leak](https://en.wikipedia.org/wiki/Memory_leak)
+ Video on [Memory Leak explained](https://www.youtube.com/watch?v=hSDAJNCVhjs)
+ More reading on [memory leak on lifehacker.com](https://lifehacker.com/what-it-really-means-when-a-program-leaks-memory-1711957819)
+ Sitepoint reading on [How Ruby uses memory](https://www.sitepoint.com/ruby-uses-memory/)
+ [Introduction to pointers](https://drive.google.com/open?id=0B__DV26QHsH4dHZQNlo4OV80c1E)

### Interview practice problems
#### String manipulation practice problems
Solve the following string manipulation practice problems:
- [Ada-C11/string_reverse](https://github.com/Ada-C11/string_reverse)
- [Ada-C11/reverse_words](https://github.com/Ada-C11/reverse_words)
- [Ada-C11/reverse_sentence](https://github.com/Ada-C11/reverse_sentence)
- [Ada-C11/palindrome_check](https://github.com/Ada-C11/palindrome_check)
- [Ada-C11/encode_repeating](https://github.com/Ada-C11/encode_repeating)
- Check if two strings are anagrams of each other: [anagram solved](http://www.geeksforgeeks.org/check-whether-two-strings-are-anagram-of-each-other/)

Here are some additional interview practice problems:
1. Submit PR for [Ada-C11/encode_repeating](https://github.com/Ada-C11/encode_repeating)
1. Submit PR for [Ada-C11/digit_match](https://github.com/Ada-C11/digit_match)

## Books
Here's a list of suggested books to read or reference:
+ [Book: Grokking Algorithms: An illustrated guide for programmers and other curious people by Aditya Bhargava](https://www.amazon.com/Grokking-Algorithms-illustrated-programmers-curious/dp/1617292230/)
+ [Book: Programming Interviews Exposed: Coding Your Way Through the Interview by John Mongan, Noah Suojanen Kindler, Eric Giguere](https://www.amazon.com/Programming-Interviews-Exposed-Through-Interview/dp/111941847X/)
+ [Book: Cracking the Coding Interview: 189 Programming Questions and Solutions by Gayle Laakmann McDowell](https://www.amazon.com/Cracking-Coding-Interview-Programming-Questions/dp/0984782850/)
+ [Book: Introduction to Algorithms by Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest, Clifford Stein](https://www.amazon.com/Introduction-Algorithms-3rd-MIT-Press/dp/0262033844)
+ [Book: Practical Object-Oriented Design in Ruby](https://www.amazon.com/Practical-Object-Oriented-Design-Ruby-Addison-Wesley/dp/0321721330)
+ [Book: Agile Software Development, Principles, Patterns and Practices](https://www.amazon.com/Software-Development-Principles-Patterns-Practices/dp/0135974445)
+ [Book: Design Patterns: Elements of Reusable Object-Oriented Software](https://www.amazon.com/Design-Patterns-Elements-Reusable-Object-Oriented/dp/0201633612)
+ [Book: Hacker's Delight by Henry S. Warren](https://www.amazon.com/Hackers-Delight-2nd-Henry-Warren/dp/0321842685)
+ [Book: Code: The Hidden Language of Computer Hardware and Software by Charles Petzold](https://www.amazon.com/Code-Language-Computer-Hardware-Software/dp/0735611319)

## Additional Learning Resources
+ Watch:
    + [Video: Crash Course in Computer Science with Carrie Anne Philbin, PBS](https://www.youtube.com/playlist?list=PL8dPuuaLjXtNlUrzyH5r6jN9ulIgZBpdo)
    + [Video: Binary and Hexadecimal number systems by Khan Academy](https://www.khanacademy.org/math/algebra-home/alg-intro-to-algebra/algebra-alternate-number-bases/v/number-systems-introduction)
    + [Video: Understanding the differences between 8bit, 16bit, 32bit, and 64bit -- Arrow Tech Trivia](https://www.youtube.com/watch?v=_SkpnG571z8)
+ Read:
    + Vaidehi Joshi's [Blog](https://medium.com/basecs)
    + [Why do array indexes start with zero - Quora discussion](https://www.quora.com/Why-do-array-indexes-start-with-0-zero-in-many-programming-languages)
    + [Original paper on when we started counting with 0: Why numbering should start at zero? - by E. W. Dijkstra](https://www.cs.utexas.edu/users/EWD/transcriptions/EWD08xx/EWD831.html)
    + [Boston University slide deck on Binary Numbers](http://www.cs.bu.edu/courses/cs101/old/2013spring/slides/CS101.03.BinaryNumbers.ppt.pdf)
    + [Understanding Big and Little Endian Byte order - BetterExplained.com](https://betterexplained.com/articles/understanding-big-and-little-endian-byte-order/)
    + [Does *bit rate* matter? - a blog on online-convert](http://blog.online-convert.com/does-bit-rate-matter-test-yourself-audio-examples/)
    + Learn about how a CPU processes instructions, espcially when it comes to [branch prediction](https://danluu.com/branch-prediction/)
    + When would you choose [**Inheritance** verses **Composition**](https://www.thoughtworks.com/insights/blog/composition-vs-inheritance-how-choose)
    + A blog post on [10 tips to write reusable code](http://hoskinator.blogspot.com/2006/06/10-tips-on-writing-reusable-code.html)
    + A blog post on [S-O-L-I-D object oriented design principles](https://scotch.io/bar-talk/s-o-l-i-d-the-first-five-principles-of-object-oriented-design)
    + Good articles by ObjectMentor on [Design Principles](http://web.archive.org/web/20060908022742/http://www.objectmentor.com:80/resources/listArticles?key=topic&topic=Design%20Principles) covers S-O-L-I-D and a few other design principles
    + TutorialsPoint on [Design Patterns Interview Questions](https://www.tutorialspoint.com/design_pattern/design_pattern_interview_questions.htm)
    + Andiamogo on [Object Oriented Design Interview Questions](http://www.andiamogo.com/S-OOD.pdf)
    + CareerCup on [Object Oriented Design Interview Questions](https://www.careercup.com/page?pid=object-oriented-design-interview-questions)


### Hashtables
+ Wikipedia on [Hash function](https://en.wikipedia.org/wiki/Hash_function)
+ TutorialsPoint material on [Hash Table](http://www.tutorialspoint.com/data_structures_algorithms/hash_data_structure.htm)
+ CMU lecture slides on [Hashing - collision resolution](http://www.cs.cmu.edu/~ab/15-121N11/lectures/lecture16.pdf)
+ CMU lecture notes on [Introduction to Hashing](http://www.cs.cmu.edu/~guna/15-123S11/Lectures/Lecture17.pdf)
+ National University of Singapore lecture slides on [Hash Tables](https://www.comp.nus.edu.sg/~ooiwt/tp/cs1102-0203-s1/lecture/10-hash.pdf)
+ Vrije Universiteit, Amsterdam lecture slides on [Hash Functions and Hash Tables](http://www.cs.vu.nl/~tcs/ds/lecture6.pdf)
+ GeeksForGeeks material on [Hashing](http://www.geeksforgeeks.org/hashing/)
+ Java: JavaHungry blog post on [Java: difference between Hashmap and Hashtable](http://javahungry.blogspot.com/2014/03/hashmap-vs-hashtable-difference-with-example-java-interview-questions.html)
+ Ruby: LaunchSchool blog on [how hash works in Ruby](https://launchschool.com/blog/how-the-hash-works-in-ruby)

+ Interview Cake content and interview questions on [Hash Table](https://www.interviewcake.com/concept/java/hash-map)
+ CareerCup [Hash Table Interview Questions](https://www.careercup.com/page?pid=hash-table-interview-questions)

### algorithms
Required: Go through what you've already learned:
+ Revise JumpStart notes on [Algorithms](https://github.com/Ada-Developers-Academy/jump-start/blob/master/lessons/02-problem-solving/notes/algorithms.md)
+ Revise classroom session on [Merge Sort](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/04-cs-fundamentals/classroom/05-Mergesort.md)
+ Revise previous session on [Binary Search Trees](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/04-cs-fundamentals/internship/Binary%20Search%20Trees.md)

## Optional: Find the reading material that helps you learn further from the links below:
+ Khan Academy on [Algorithms](https://www.khanacademy.org/computing/computer-science/algorithms)
+ Khan Academy on [Divide and Conquer algorithms](https://www.khanacademy.org/computing/computer-science/algorithms/merge-sort/a/divide-and-conquer-algorithms)
+ Khan Academy on [Graphs](https://www.khanacademy.org/computing/computer-science/algorithms/graph-representation/a/describing-graphs)
+ Kal academy's material on [Graphs](https://drive.google.com/drive/folders/0BxHords9odw3ZVM2cTVUdUdoSkU)
+ Khan Academy on [Quick sort](https://www.khanacademy.org/computing/computer-science/algorithms/quick-sort/a/overview-of-quicksort)
+ Cornell CS2110 notes on [Selection problem/Finding the median](http://www.cs.cornell.edu/courses/cs2110/2009su/Lectures/examples/MedianFinding.pdf)
+ Youtube video on [Selection problem](https://www.youtube.com/watch?v=FTYmprytqvM)
+ Read about [Binary Heap Data Structure](http://quiz.geeksforgeeks.org/binary-heap/) on GeeksForGeeks
+ Book: [Fundamentals of Computer Algorithms by Ellis Horowitz, Sartaj Sahani](https://www.amazon.com/Fundamentals-Computer-Algorithms-software-engineering/dp/0914894226)
+ Book: [Fundamentals of Algorithmics by Gilles Brassard, Paul Bratley](https://www.amazon.com/Fundamentals-Algorithmics-Gilles-Brassard/dp/0133350681)

## Interview Practice
The following resources would help with getting additional white boarding interview and code challenge practice:
+ [Tutorials and code challenges by Gale Laakmann McDowell on HackerRank](https://www.hackerrank.com/domains/tutorials/cracking-the-coding-interview)
+ [Code challenge and white boarding practice on HackerRank](https://www.hackerrank.com/)
+ [Practice problems on LeetCode](https://leetcode.com/)
+ [Code challenge and white boarding practice on CodeFlights](https://codefights.com/)
+ [White boarding practice by pairing up on Pramp](https://www.pramp.com/#/)


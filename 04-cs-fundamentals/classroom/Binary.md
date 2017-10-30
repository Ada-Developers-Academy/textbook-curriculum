# Introduction to Binary & Memory
## Learning Goals
+ Understand binary
  + Convert from binary to decimal
  + Convert from decimal to binary
+ In the context of computer memory, understand
  + Bits
  + Bytes
  + How data is stored in memory
  + High level computer organization: CPU, Main memory & Bus

## Notes
+ There's no homework due before we meet for class. We'll chat about homework due after class during class time.
+ For most CS Fundamentals sessions, we'll observe a closed laptop policy. Please bring along a notebook/papers and pen/pencil to every class. 

## Essential Reading:
Here's some good follow up reading after we meet in class:
  + [Computer Data Basics](https://docs.google.com/document/d/1g-Dxn1rVTChBs9ZZSOgmohjP_RoWNyPJTE-m_n35aZ0/edit)
  + [Video: Understand how memory addressing works](https://www.youtube.com/watch?v=F0Ri2TpRBBg)

## Exercises
Here's the exercises we'll cover in class
1. Devise an algorithm to accept 8 binary digits from a user. Convert this eight-digit binary number to decimal number using the approach we learned in class.
2. Calculate the decimal equivalent for these binary numbers: 453, 49, 234, 432
3. Calculate the binary equivalent for these decimal numbers: 1101, 0101, 1001, 1010, 1111, 11000011

## Assignments
Assignments are expected to be worked on after the class discussion and due before the next class.
Fork, clone and complete the assignments on [Ada-C8/BinaryAndDecimal](https://github.com/Ada-C8/BinaryAndDecimal).
1. Write a method named `binary_to_decimal` that creates an array of size 8. Fill the array randomly with 0’s and 1’s. Print out the array so that it appears as a binary number. Calculate the decimal value for this binary number using the algorithm you devised in class. Print out the decimal value.
2. This question has two parts:
   - <strong>Devise an algorithm</strong> Imagine you've been given two sets of integers. e.g. the first set is [30, 20, 10, 4] and the second set is [20, 10, 4]. Devise an algorithm that compares the two sets and returns true if the two sets have the same integers and in the same order, and returns false otherwise. e.g. In our example case, for [30, 20, 10, 4] and [20, 10, 4], the two sets do not have all the same integers (30 is the difference) and the order is only partially the same. So, the algorithm should return false.
   - <strong>Author a method</strong> named `array_equals` that accepts two integer arrays as parameters (representative of the two sets). The method return `true` if the arrays contain the same elements in the same order, and returns `false` otherwise. 
Note: Do not use Array class methods for comparing the whole array at once. You may use array indexing to retrieve one element at a time, compare individual elements with each other and you may retrieve the length of an array.


## Additional Resources:
Videos and additional reading material for furthering your learning for curiosity on topics related to what we covered in class:
   + [Video: Binary and Hexadecimal number systems by Khan Academy](https://www.khanacademy.org/math/algebra-home/alg-intro-to-algebra/algebra-alternate-number-bases/v/number-systems-introduction)
   + [Why do array indexes start with zero - Quora discussion](https://www.quora.com/Why-do-array-indexes-start-with-0-zero-in-many-programming-languages)
   + [Original paper on when we started counting with 0: Why numbering should start at zero? - by E. W. Dijkstra](https://www.cs.utexas.edu/users/EWD/transcriptions/EWD08xx/EWD831.html)
   + [Does *bit rate* matter? - a blog on online-convert](http://blog.online-convert.com/does-bit-rate-matter-test-yourself-audio-examples/)
   + [Video: Understanding the differences between 8bit, 16bit, 32bit, and 64bit -- Arrow Tech Trivia](https://www.youtube.com/watch?v=_SkpnG571z8)
   + Learn about how a CPU processes instructions, espcially when it comes to [branch prediction](https://danluu.com/branch-prediction/)
   + [Book: Hacker's Delight by Henry S. Warren](https://www.amazon.com/Hackers-Delight-2nd-Henry-Warren/dp/0321842685)
   + [Book: Code: The Hidden Language of Computer Hardware and Software by Charles Petzold](https://www.amazon.com/Code-Language-Computer-Hardware-Software/dp/0735611319)

## Slide Deck
+ Slide Deck used in class</br>
<span xmlns:dct="http://purl.org/dc/terms/" property="dct:title"><a href="https://drive.google.com/file/d/0B__DV26QHsH4YzhFWFVnbEp2akU/view?usp=sharing">A brief introduction to Binary and Memory</a></span> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License</a>.</br>
<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" /></a><br />

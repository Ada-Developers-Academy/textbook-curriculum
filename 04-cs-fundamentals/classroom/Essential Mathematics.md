This section describes some of the fundamental mathematical terms and concepts that every CS professional should be familiar with.

# Decimal number system
The decimal number system or base-10 number system is the numbering system we use in everyday which consists of ten unique symbols known as digits: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9. It also includes the decimal point (floating point/dot) symbol to represent decimal fractions like 2.45  In a base-10 system the number 543.21 represents the sum (5 × 102) + (4 × 101) + (3 × 100) + (2 × 10−1) + (1 × 10−2).
Further reading: https://www.britannica.com/science/decimal-number-system

# Natural numbers
Natural numbers, sometimes known as counting numbers or whole numbers, are numbers used to count in everyday use. Some definitions begin natural numbers with 0. E.g. 0, 1, 2, 3 … Other definitions do not include 0 and begin natural numbers at 1. E.g. 1, 2, 3 …
Further reading: https://en.wikipedia.org/wiki/Natural_number

# Integers
An Integer is a number that can be written without a fractional component. Integers consist of zero (0), positive natural numbers (1, 2, 3 …) and their negative counterpart (-1, -2, -3 …).
Further reading: https://en.wikipedia.org/wiki/Integer

# Sorted (ascending/descending)
A set of objects that can be ordered may be sorted in ascending or descending order. When the objects are ordered from lowest value to highest value, the sorting order is said to be in ascending order. E.g. a, b, c, d, f, k, x, z are alphabets sorted in ascending order. When the objects are ordered from highest value to lowest value, the sorting order is said to be in descending order e.g. 98, 72, 13, -1, -37, -64 are integers sorted in descending order.

# Average/Mean
In every day usage, the terms average and mean are used interchangeably. The mean or average of a collection of numbers is the sum of the numbers divided by the total count of numbers. E.g. Given a collection of numbers: 42, 14, 73, 5 and 10. The average or mean of these five numbers is calculated as (42 + 14 + 73 + 5 + 10) / 5 = 144 / 5 = 28.8

# Median
The median of a collection of numbers is the middle number if the numbers are ordered (ascending/descending). E.g. given the following numbers: 45, 72, 12, 7 and 15. If we were to sort these numbers in ascending order, they would look like: 7, 12, 15, 45, 72. The middle number of these five sorted numbers is 15 and hence 15 is the median of the values 45, 72, 12, 7 and 15.
Note: If there are even number of values, then the median may be considered as the middle two values if the values were sorted. Alternatively, sometimes, depending on usage and definition provided, the median of even number of values may be considered as the average of the middle two values. E.g. Given 56, 42, 5, 13, 28, 74. The middle two values in these 6 numbers are 28 and 42. Some definitions will consider 28 and 42 to be the median values. Other, will calculate the average of 28 and 42 i.e. (28 + 42) / 2 = 70 / 2 = 35 and consider 35 to be the median value. If it is not stated, it’s best to clarify the definition of median for even number of values.

# Modulo and Divide
Consider the decimal number 54321. 54321 % 10, read as 54321 mod 10 or 54321 modulo 10 gives us the remainder after 54321 is divided by 10. 54321 % 10 = 1. In other words, modulo 10 gives us the last digit of the number. Similarly, 54321 % 100 = 21 which are the last two digits of 54321. 54321 % 10000 = 4321, which is all but the first digit of the number, 54321.

Similarly, 54321 divided by 10 i.e. 54321 / 10 = 5432. Observe that the last digit got removed from the original number on dividing by 10. 54321 / 100 = 543. Note that the last two digits got removed from the original number.

# Set theory basics
- A **Set** is a well-defined collection of distinct objects. </br>
E.g. {45, 72, 34, 89} is a set of positive integers. </br>
On the otherhand, {56, 78, 42, 98, 78} is not a set because the integers are not distinct since 78 shows up twice.
- A set may be empty and is mathematically represented as {}
- **Intersection of two sets** is a new set constructed by determining common members between the two sets. </br>
The intersection of A and B, denoted by A ∩ B, is the set of all things that are members of *both A and B*.	</br>
E.g. Intersection of {23, 45, 78} and {42, 56, 23, 98, 45, 31} is {23, 45} </br>
{54, 34, 89} and {90, 45} are disjoint since they do not have any members in common.
-	**Union of two sets** is a new set constructed by adding the members of the two sets. If there are common members in the two sets, they show up only once in the union set.</br>
The union of A and B, denoted by A ∪ B, is the set of all things that are members of *either A or B*.</br>
E.g. Union of {23, 42, 56} and {21, 56, 42, 89} is {21, 23, 42, 56, 89}

# Decimal to Binary, Binary to Decimal
## Everyday numbers / Natural numbers / Decimal numbers 
The decimal numbering system are the numbers we use in everyday life. The decimal numbering system has ten distinct unique numbers.
```
[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
```
There is pattern in how we count…
- Start with 0
- Keep adding one to count up:
```
0 + 1 = 1
1 + 1 = 2
…
8 + 1 = 9
```
- Until we reach the last digit. Then we reset the Least Significant Digit to 0, and change the digit to its left from 0 to 1. And then, continue the pattern of adding one.
```
9 + 1 = 10
10 + 1 = 11
11 + 1 = 12
…
```
- The pattern continues with the next digit...
```
…
19 + 1 = 20
20 + 1 = 21
…
98 + 1 = 99
99 + 1 = 100
100 + 1 = 101
…
199 + 1 = 200
…
209 + 1 = 210
210 + 1 = 211
…
299 + 1 = 300
…
```
**Key Observations**
- While counting in a numbering system with 10 possible digits, 
- We start with the lowest value digit aka 0
- We keep adding one to count and go through the list possible digits
- Once we reach the highest value digit aka 9, we reset the lowest significant digit to 0 and increment the digit to its left by 1

## Binary numbers
Binary numbers  have two distinct Binary digits (or Bits for short)
```
[0, 1]
```
The pattern for counting is the same as with every day natural numbers. Only instead of 10 possible values for a digit in decimal numbers, we only have two possible values for a digit in binary.
- Start with 0
- Count to the maximum possible value i.e. 1
- Then reset the least significant digit and increment the digit to its left.
So, we have:
```
0
1
10
11
100
101
110
111
1000
```
Here's a table of binary number next to the it's equivalent and corresponding decimal number. Observe the patterns in the numbers

Binary    | Decimal
----------|----------------
000**0**  | 0**0**
000**1**  | 0**1**
00**1**0  | 0**2**
0011		  | 0**3**
0**1**00	|	0**4**
0101		  | 0**5**
0110		  | 0**6**
0111		  | 0**7**
**1**000  | 0**8**
1001		  | 0**9**
1010		  | **1**0
1011		  | 11
1100		  | 12
 …  		  | …

## Converting from Binary to Decimal
Before we look at how to convert a binary number like 1101<sub>2</sub> into it's decimal equivalent. Let's breakdown a decimal number that will help us see a pattern and determine an approach.
Let’s consider: 453 in decimal i.e. 453<sub>10</sub>. In everyday world, we assume that we are talking about base 10 numbers i.e. all numbers are assumed to have subscript 10 since we are talking decimal numbers. Here's one way of breaking down 453<sub>10</sub>:</br>
 453<sub>10</sub> = 400 + 50 + 3</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;= (**4** * 100) + (**5** * 10) + (**3** * 1)</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=   3 * (10<sup>0</sup>)</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  + 5 * (10<sup>1</sup>)</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  + 4 * (10<sup>2</sup>)</br>
Now let’s consider a binary number, let’s say: 1101<sub>2</sub>. Binary numbers have the base 2, i.e. subscript 2. With binary numbers (as compared to decimal), we use powers of 2 instead of powers of 10.</br>
**1101**<sub>2</sub> = **1**000 + **1**00 + **0**0 + **1**</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =  1 * (2<sup>0</sup>)</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  + 0 * (2<sup>1</sup>)</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  + 1 * (2<sup>2</sup>)</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  + 1 * (2<sup>3</sup>)</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = 1 + 0 + 4 + 8 = **13**<sub>10</sub></br>
We just converted 1101<sub>2</sub> to its equivalent decimal number i.e. 13<sub>10</sub></br>

As you noticed in the math above, anything raise to the power of 0 is 1 – independent of the numbering system in use.</br>
0<sub>2</sub> = (0 * 2<sup>0</sup>) = 0<sub>10</sub></br>
1<sub>2</sub> = (1 * 2<sup>0</sup>) = 1<sub>10</sub></br>
10<sub>2</sub> = (0 * 2<sup>0</sup>) + (1 * 2<sup>1</sup>) = 2<sub>10</sub></br>
</br>
_Reminder_: Anything to the power 0 equals 1</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1<sup>0</sup> = 1</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2<sup>0</sup> = 1</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10<sup>0</sup> = 1</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_n_<sup>0</sup> = 1</br>
</br>
To recap, here's how we converted 1101<sub>2</sub> to its decimal equivalent:</br>
1101<sub>2</sub> = (1 * 2<sup>0</sup>) + (0 * 2<sup>1</sup>) + (1 * 2<sup>2</sup>) + (1 * 2<sup>3</sup>)</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;= 1 + 0 + 4 + 8</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;= 13<sub>10</sub></br></br>

Let's walk through another conversion exercise together. Let's convert 0101<sub>2</sub> to its decimal equivalent. Try this out on your own using the approach we used for 1101<sub>2</sub> above.</br>
**0101**<sub>2</sub> = (1 * 2<sup>0</sup>) + (0 * 2<sup>1</sup>) + (1 * 2<sup>2</sup>) + (0 * 2<sup>3</sup>)</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;= 1 + 0 + 4 + 0</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;= 5<sub>10</sub></br></br>

### Exercises
Convert the following binary numbers to their decimal equivalent number using the approach we learned above:
1. 1001<sub>2</sub>
1. 1010<sub>2</sub>
1. 1111<sub>2</sub>
1. 11000011</sub>
Check your answers by comparing with the [solutions](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/04-cs-fundamentals/classroom/solutions/binary_to_decimal.md).

## Converting from Decimal to Binary
Content to come

### Exercises
Convert the following decimal numbers to their binary equivalent number using the approach we learned above:
1. 453
1. 49
1. 234
1. 432

## Further Reading exercise
Learn how to convert a decimal number to a binary number and vice versa, as well as [Computer Data Basics](https://docs.google.com/document/d/1g-Dxn1rVTChBs9ZZSOgmohjP_RoWNyPJTE-m_n35aZ0/edit). 


<!-- TO DO:  Add the following
Exponential

Logarithmic

Linear

Quadratic 

Cubic

Polynomial (and non-polynomial)
-->

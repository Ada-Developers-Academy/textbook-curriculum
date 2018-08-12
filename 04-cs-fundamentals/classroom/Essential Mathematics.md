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
Learn how to convert a decimal number to a binary number and vice versa, as well as [Computer Data Basics](https://docs.google.com/document/d/1g-Dxn1rVTChBs9ZZSOgmohjP_RoWNyPJTE-m_n35aZ0/edit). 
## Exercises
1. Calculate the decimal equivalent for these binary numbers: 453, 49, 234, 432
1. Calculate the binary equivalent for these decimal numbers: 1101, 0101, 1001, 1010, 1111, 11000011
Check your answer by using a calculator. Ensure you understand and can explain your algorithm for converting from binary to decimal and from decimal to binary numbers.

<!-- TO DO:  Add the following
Exponential

Logarithmic

Linear

Quadratic 

Cubic

Polynomial (and non-polynomial)
-->

# Essential Mathematics for Software Engineers
*CS fundamentals 0*

## Learning Goals
The primary goal of this lesson is to revise some of the fundamental mathematical terms and concepts that every software engineer should know.

We will also get introduced to the *Binary number system* and learn to convert numbers from *decimal* to *binary* and vice versa.

## Activities
* Read the [notes](#notes) in this section.
* Complete the [practice problems](maths-exercises/essential-maths-exercises.md) and check your learning
* Read the [notes on binary numbers, and conversion to and from decimal numbers](maths-exercises/decimal-and-binary-conversions.md)

## Notes
By the end of this lesson, students should be familiar with the following concepts:
1. [Decimal number system](#decimal-number-system)
1. [Natural numbers](#natural-numbers)
1. [Sum of *n* consecutive natural numbers](#sum-of-consecutive-natural-numbers)
1. [Maximum and Minimum](#maximum-and-minimum)
1. [Sorting](#sorting)
1. [Integers](#integers)
1. [Modulo and Divide](#modulo-and-divide)
1. [Average or Mean](#average-or-mean)
1. [Median](#median)
1. [Exponents and Logarithms](#exponents-and-logarithms)
1. [Set Theory basics](#set-theory-basics)

### Decimal number system
The *decimal number system* or *base-10 number system* is the numbering system we use in everyday life. This numbering system consists of ten unique symbols known as digits: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9. It also includes the decimal point (floating point/dot) symbol to represent decimal fractions like 2.45  In a base-10 system the number 543.21 represents the sum (5 × 10<sup>2</sup>) + (4 × 10<sup>1</sup>) + (3 × 10<sup>0</sup>) + (2 × 10<sup>−1</sup>) + (1 × 10<sup>−2</sup>).

Further reading: https://www.britannica.com/science/decimal-number-system

### Natural numbers
*Natural numbers*, sometimes known as *counting numbers* or *whole numbers*, are numbers used to count in everyday use. Some definitions begin natural numbers with 0.
```
0, 1, 2, 3 …
```
Other definitions do not include 0 and begin natural numbers at 1.
```
1, 2, 3 …
```

Further reading: https://en.wikipedia.org/wiki/Natural_number

### Sum of consecutive natural numbers
In some of the data structures and algorithms lessons we will be covering, we will need to be familiar with the sum of the first n consecutive natural numbers. In this section, we will understand this problem and use an example to understand the solution.

<b>Problem statement</b>: What would be the sum of sequential, consecutive natural numbers starting with *0*, upto and including *n*? Is there a way to describe this sum in terms of *n*?

To think about this, let's consider an example value of *n* = *99*.
Then, the sum of all sequential natural numbers from 0 through 99 would look like:
```
0 + 1 + 2 + 3 + … + 48 + 49 + 50 + 51 + … + 96 + 97 + 98 + 99
```
Considering the sum of the last and the first values in the above summation, we have ```99 + 0 = 99```
Similarly, considering the sum of the second from the last, and the second values in the summation, we have ```98 + 1 = 99```
We see the same pattern continue with the sum of the third from the last and the third values: ```97 + 2 = 99```</br>

Therefore,

```
0 + 1 + 2 + 3 + … + 48 + 49 + 50 + 51 + … + 96 + 97 + 98 + 99
```

could be written as:

```
(0 + 99) + (1 + 98) + (2 + 97) + (3 + 96) + ... + (47+ 52) + (48 + 51) + (49 + 50)
```
Observe that there are a total of 50 pairs of values, each adding up to ```99``` in the summation above.

Therefore, this summation turns out to be the same as:
```
99 + 99 + 99 + … + 99 (a total of 50 times)
```
or
```
99 * 50
```

In our example, *n* was *99*. </br>
*50* can be thought of as *100/2*.</br>
In terms of *n*, we can describe *50* as *(n+1)/2*.</br>
As a result, we can say that if *n* is *99*, then the sum of natural numbers starting from *0* to *n* is <b>*99 * 50* = *n * (n + 1)/2*</b>

Therefore, the sum of sequential natural numbers starting from *0* to *n* is <b>*n * (n + 1)/2*</b>.

*Note*: The mathematical proof for the above is beyond the scope of our CS Fundamentals' study.


Further reading: https://en.wikipedia.org/wiki/Integer

### Maximum and Minimum
The <b>maximum</b> value in a list of numbers is the largest value in the list.</br>
E.g. *42* is the maximum value in the list: 21, 4, 9, 20, 17, 42, 13, 8.

The <b>minimum</b> value in a list of numbers is the smallest value in the list.</br>
E.g. *4* is the minimum value in the list: 21, 4, 9, 20, 17, 42, 13, 8.

### Sorting
Sorting is the action of arranging a list of items following a certain logical pattern. A list of objects that can be ordered may be sorted in <b>ascending</b> or <b>descending</b> order.

Consider the list of numbers: `21, 4, 9, 20, 17, 42, 13, 8`

When the objects are *ordered from lowest value to highest value, the sorting order is said to be in ascending order*. In our example, that would be `4, 8, 9, 13, 17, 20, 21, 42`.

When the objects are *ordered from highest value to lowest value, the sorting order is said to be in descending order*. In our example, that would be `42, 21, 20, 17, 13, 9, 8, 4`.

You can also sort things other than numbers, like words. Intuitively we need to put them in alphabetical order, though convincing a computer to do so is a little trickier. For example:

`banana, strawberry, coconut, apple` in *ascending order* would be `apple, banana, coconut, strawberry`.

### Integers
An Integer is a number that can be written without a fractional component. Integers consist of zero (0), positive natural numbers (1, 2, 3 …) and their negative counterpart (-1, -2, -3 …).

### Modulo and Divide
In this section, we'll revise modulo and integer division operations. Note that we will only consider integer numbers as operands and as the result.

#### Modulo
Consider an integer value, 54321. <b>54321 % 10</b>, read as *54321 mod 10* or *54321 modulo 10* gives us the <b>remainder after 54321 is divided by 10</b>. 54321 % 10 = 1. Because there are ten digits in the decimal number system, modulo 10 gives us the last digit of the number. Similarly, 54321 % 100, gives us the remainder after 54321 is divided by 100. This happens to be 21, which are the last two digits of 54321. 54321 % 10000 = 4321, which are all but the first digit of the number 54321.

Examples:
* *33 mod 2* gives us the remainder after 33 is divided by 2. Therefore, *33 mod 2* is *1*.
* *68 mod 3* gives us the remainder after 68 is divided by 3. Therefore, *68 mod 3* is *2*.

Modulo can be used to check if a number is divisible by another number. If a number, *x* is completely divisible by another number, *y*, then the resulting modulo, *x mod y* will be *0*. e.g. Since 25 is divisible by 5, *25 % 5* will return *0*. In contrast, since 26 is not divisible by 5, the result of *26 % 5* is *1* (not zero).

#### Divide
Consider the same integer value, 54321. When the integer 54321 is divided by 10 i.e. *54321 / 10*, we get the result of *5432*. Observe that the last digit got removed from the original number on dividing by 10. Similarly, *54321 / 100 = 543*. Note that the last two digits got removed from the original number.

Examples:
* *33 divided by 2* i.e. *33 / 2* is *16*.
* *68 divided by 3* i.e. *68 / 3* is *22*.

### Average or Mean
In every day usage, the terms *average* and *mean* are used interchangeably. <b>The *mean* or *average* of a collection of numbers is the sum of the numbers divided by the total count of numbers.</b>

E.g. Given a collection of numbers: `42, 14, 73, 5 and 10`. The average or mean of these five numbers is calculated as
```
(42 + 14 + 73 + 5 + 10) / 5
= 144 / 5
= 28.8
```

### Median
<b>The *median* of a collection of numbers is the middle number if the numbers were sorted (ascending/descending)</b>.

E.g. Given the following numbers: `45, 72, 12, 7 and 15`. If we were to sort these numbers in *ascending order*, they would look like: `7, 12, 15, 45, 72`. The middle number of these five sorted numbers is `15` and hence 15 is the median of the values `45, 72, 12, 7 and 15`.

<b>Note</b>: If there are an even count of values, then the median may be considered as the middle two values if the values were sorted. Alternatively, sometimes, depending on the usage and definition provided, the median of an even count of values may be considered to be the average of the middle two values if the values were sorted.

E.g. Given `56, 42, 5, 13, 28, 74`. The middle two values in these *six* numbers are `28` and `42`. Some definitions will consider `28` and `42` to be the median values. Others will calculate the *average of the middle two values to compute the median*. Average of `28` and `42` is `(28 + 42) / 2 = 70 / 2 = 35` and hence, in those definitions, `35` will be considered to be the median value. If it is not stated, it’s best to clarify the definition of median for even number of values.

### Exponents and Logarithms
Before we look into *exponents* and *logarithms*, let's take a step back and consider <b>multiplication</b>. </br>
Let's consider twenty one multiplied by three:</br>
_21 \* 3_

<b>Multiplication can be viewed as repeated addition.</b> As such, twenty one multiplied by three can viewed as adding twenty one three time like so:</br>
_21 \* 3_ = *21 + 21 + 21* = *63*

Similarly, <b>exponents can be viewed as repeated multiplication.</b></br>
For example;</br>
_21 \* 21 \* 21_ = *21<sup>3</sup>*

In the expression, <b>*21<sup>3</sup>*</b>, *21* is known as the <b>base</b> and *3* is known as the <b>exponent</b>. With the base of *21* and exponent of *7*, we have *21<sup>7</sup>*. This can also be read as *twenty one raise to the power of seven*. An exponent tells us to multiply the base to itself that many number of times. e.g.</br></br>
*21<sup>3</sup>* = _21 \* 21 \* 21_ = *9261* </br>
Read as *twenty one raise to the power of three*.

*21<sup>2</sup>* = _21 \* 21_ = *441* </br>
Read as *twenty one raise to the power of two*.

*21<sup>1</sup>* = *21* </br>
Read as *twenty one raise to the power of one*.

*21<sup>0</sup>* = *1* </br>
Read as *twenty one raise to the power of zero*.</br></br>
<b>Note</b>: Any base with an exponent of 0 is equal to 1.

A special form of <b>exponents</b> are <b>square</b>. For example, *21<sup>2</sup>* read as *twenty one squared* means *multiplying a number by itself*.</br>
When we say, *twenty one cubed*, we mean *21<sup>3</sup>* i.e. _21 \* 21 \* 21_.</br>
Learn and revise more about [Exponents on Khan Academy](https://www.khanacademy.org/math/pre-algebra/pre-algebra-exponents-radicals).

<b>Exponents</b> and <b>Logarithms</b> are closely related. In many ways, we are sharing the same fact in different ways. <b>Logarithms</b> are a way of thinking of exponents in the reverse way. To find the exponent, we'd ask a question of the form: *what do we get when we raise twenty one to the power of three?*, which will give us the answer of *9261*. In contrast, with logarithms, we'd ask a question of the form: *how many twenty one does it take to make 9261?*, which will give us the answer of *3*.

*Whilst exponential expression tells us what we will get if we start with one and keep multiplying the base exponent number of times, logarithmic expressions tell us how many times we will need to keep dividing by the base to get one.*</br>
e.g. If we start with *1* and keep multiplying *2* to itself, *4* times, we are describing *2<sup>4</sup>*, which is *16*. Where as if we start with *16* and keep dividing by *2* until we reach *1*, we are describing *log<sub>2</sub> (16)*, which is *4*.

<b>*log<sub>2</sub> (16)*</b> is a logarithm. To write a logarithm:
- Start with the word, "*log*"
- Next is the <b>base</b>, which is written as a subscript. (*2* in the expression above).
- Finally, the number we're taking the logarithm of follows. (*16* in the expression above).

We have seen the exponential expression, <b>*21<sup>3</sup>* = *9261*</b>. We can state the same fact using a logarithm by saying, <b>*log<sub>21</sub> (9261)* = *3*</b>.

We may read these expressions in one of the following variations:
- *21<sup>3</sup>* = *9261*
    - Twenty one raise to power three is ninety two hundred and sixty one.
    - Twenty one cubed is nine thousand two hundred and sixty one.
- *log<sub>21</sub> (9261)* = *3*
    - Logarithm of ninety two hundred and sixty one, to the base of twenty one is three.
    - Log of nine thousand two hundred and sixty one, to the base of twenty one is three.

Often times the base is omitted from a logarithm when it *should be* clearly implied from the context. In computer science, if you see *log* without a base, it almost always means *log<sub>2</sub>*.

Let's consider a few examples by viewing <b>exponential expression</b> and the corresponding <b>logarithmic expressions</b> side by side:

Exponents | Logarithms |
--------- | ---------- |
*21<sup>3</sup>* = *9261* | *log<sub>21</sub> (9261)* = *3*
*2<sup>3</sup>* = *8* | *log<sub>2</sub> (8)* = *3*
*10<sup>5</sup>* = *100000* | *log<sub>10</sub> (100000)* = *5*
*3<sup>2</sup>* = *9* | *log<sub>3</sub> (9)* = *2*
*2<sup>3</sup>* = *8* | *log<sub>2</sub> (8)* = *3*

Learn and revise more [Logarithms on Khan Academy](https://www.khanacademy.org/math/algebra2/exponential-and-logarithmic-functions).

<b>Asides</b>:
* To represent really large numbers (think lots of zeroes), in our everyday numbering system, exponents often get used to share this concisely. e.g.
  * *300000000* could be represented as _3 \* 10<sup>8</sup>_
  * *0.000000015* could be represented as _15 \* 10<sup>-9</sup>_
* As we will soon learn, computers store information in *binary system* instead of the everyday, *decimal system*. This means, while talking about information saved on the computer, we are often thinking in terms of *base 2* (*bi* means "two" in latin) instead of *base 10* (*deca* means "ten" in Latin). More on this later.

### Set theory basics
* A <b>Set</b> is a well-defined collection of distinct objects.
  * E.g. {45, 72, 34, 89} is a set of positive integers.
  * On the other hand, {56, 78, 42, 98, 78} is not a set because the integers are not distinct since 78 shows up twice.
  * A set may be *empty* and is mathematically represented as *{}*
* <b>Intersection of two sets</b> is a new set constructed by determining *common members between the two sets*.
  * The intersection of A and B, denoted by *A ∩ B*, is the set of all things that are members of *both A and B*.
  * E.g. Intersection of {23, 45, 78} and {42, 56, 23, 98, 45, 31} is {23, 45}
  * E.g. {54, 34, 89} and {90, 45} are *disjoint* since they do not have any members in common.
* <b>Union of two sets</b> is a new set constructed by *adding the members of the two sets*.
  * If there are common members in the two sets, they show up only once in the union set.
  * The union of A and B, denoted by *A ∪ B*, is the set of all things that are members of *either A or B*.
  E.g. Union of {23, 42, 56} and {21, 56, 42, 89} is {21, 23, 42, 56, 89}

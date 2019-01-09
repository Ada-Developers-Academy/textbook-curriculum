# Essential Mathematics for Software Engineers
_CS fundamentals 0_

## Learning Goals
The primary goal of this lesson is to revise or get familiar with some of the fundamental mathematical terms and concepts that every CS professional should be know.

We will also get introduced to the _Binary number system_ and learn to convert numbers from _decimal_ to _binary_ and vice versa.

## Activities
* Read the [notes](notes) in this section.
* Complete the [practice problems]() and check your learning
* Read the [notes on binary numbers and conversion to and from decimal numbers](#./maths-exercises/decimal-and-binary-conversions.md)

## Notes
By the end of this lesson you would get familiar with or would have revised the following concepts:
1. [Decimal number system](#decimal-number-system)
1. [Natural numbers](#natural-numbers)
1. [Sum of _n_ consecutive natural numbers](#sum-of-consecutive-natural-numbers)
1. [Integers](#integers)
1. [Maximum and Minimum](#maximum-and-minimum)
1. [Sorting](#sorting)
1. [Average or Mean](#average-or-mean)
1. [Median](#median)
1. [Modulo and Divide](#modulo-and-divide)
1. [Exponents and Logarithms](#exponents-and-logarithms)
1. [Set Theory basics](#set-theory-basics)

### Decimal number system
The _decimal number system_ or _base-10 number system_ is the numbering system we use in everyday which consists of ten unique symbols known as digits: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9. It also includes the decimal point (floating point/dot) symbol to represent decimal fractions like 2.45  In a base-10 system the number 543.21 represents the sum (5 × 10<sup>2</sup>) + (4 × 10<sup>1</sup>) + (3 × 10<sup>0</sup>) + (2 × 10<sup>−1</sup>) + (1 × 10<sup>−2</sup>).

Further reading: https://www.britannica.com/science/decimal-number-system

### Natural numbers
_Natural numbers_, sometimes known as _counting numbers_ or _whole numbers_, are numbers used to count in everyday use. Some definitions begin natural numbers with 0. 
```
0, 1, 2, 3 … 
```
Other definitions do not include 0 and begin natural numbers at 1. 
```
1, 2, 3 …
```

Further reading: https://en.wikipedia.org/wiki/Natural_number

### Sum of consecutive natural numbers
**Problem statement**: What would be the sum of sequential, consecutive natural numbers starting with *0*, upto and including *n*? Is there a way to describe this sum in terms of *n*?

To think about this, let's consider an example value of *n* = *99*.
Then, the sum of all sequential natural numbers from 0 through 99 would like:
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

This summation hence turns out to be the same as:
```
99 + 99 + 99 + … + 99 (a total of 50 times)
```
or
```
99 * 50
```

In our example, *n* was *99*. </br>
*50* can be thought of as *100/2* or, in terms of *n*, we can describe *50* as *(n+1)/2*.</br>
As a result, we can say that if *n* is *99*, then **_99 * 50_ = _n * (n + 1)/2_**

Therefore, **the sum of sequential natural numbers starting from *0* to *n* is _n * (n + 1)/2_**.

_Note_: The mathematical proof for this is beyond the scope of our CS Fundamentals study.


### Integers
An Integer is a number that can be written without a fractional component. Integers consist of zero (0), positive natural numbers (1, 2, 3 …) and their negative counterpart (-1, -2, -3 …).

Further reading: https://en.wikipedia.org/wiki/Integer

### Maximum and Minimum
The **maximum** value in a list of numbers is the largest value in the list.</br>
E.g. *42* is the maximum value in the list: 21, 4, 9, 20, 17, 42, 13, 8.

The **minimum** value in a list of numbers is the smallest value in the list.</br>
E.g. *4* is the minimum value in the list: 21, 4, 9, 20, 17, 42, 13, 8.

### Sorting
Sorting is the action of arranging a set of items following a certain logical pattern. A set of objects that can be ordered may be sorted in **ascending** or **descending** order.

When the objects are *ordered from lowest value to highest value, the sorting order is said to be in ascending order*.</br>
E.g. `a, b, c, d, f, k, x, z` are alphabets sorted in ascending order.

When the objects are *ordered from highest value to lowest value, the sorting order is said to be in descending order*.</br>
E.g. `98, 72, 13, -1, -37, -64` are integers sorted in descending order.

### Average or Mean
In every day usage, the terms _average_ and _mean_ are used interchangeably. **The _mean_ or _average_ of a collection of numbers is the sum of the numbers divided by the total count of numbers.**

E.g. Given a collection of numbers: `42, 14, 73, 5 and 10`. The average or mean of these five numbers is calculated as 
```
(42 + 14 + 73 + 5 + 10) / 5 
= 144 / 5 
= 28.8
```

### Median
**The _median_ of a collection of numbers is the middle number if the numbers were sorted (ascending/descending)**. 

E.g. Given the following numbers: `45, 72, 12, 7 and 15`. If we were to sort these numbers in _ascending order_, they would look like: `7, 12, 15, 45, 72`. The middle number of these five sorted numbers is `15` and hence 15 is the median of the values `45, 72, 12, 7 and 15`.

**Note**: If there are an even count of values, then the median may be considered as the middle two values if the values were sorted. Alternatively, sometimes, depending on the usage and definition provided, the median of an even count of values may be considered to be the average of the middle two values if the values were sorted.

E.g. Given `56, 42, 5, 13, 28, 74`. The middle two values in these `6` numbers are `28` and `42`. Some definitions will consider `28` and `42` to be the median values. Other, will calculate the _average of the middle two values to compute the median_. Average of `28` and `42` is `(28 + 42) / 2 = 70 / 2 = 35` and hence, in those definitions, 35 will be considered to be the median value. If it is not stated, it’s best to clarify the definition of median for even number of values.

### Modulo and Divide
#### Modulo
Consider the decimal number 54321. **54321 % 10**, read as *54321 mod 10* or *54321 modulo 10* gives us the **remainder after 54321 is divided by 10**. 54321 % 10 = 1. Because there are ten digits in the decimal number system, modulo 10 gives us the last digit of the number. Similarly, 54321 % 100 = 21 which are the last two digits of 54321. 54321 % 10000 = 4321, which is all but the first digit of the number, 54321.

Examples:
* _33 mod 2_ gives us the remainder after 33 is divided by 2. Therefore, _33 mod 2_ is *1*.
* _68 mod 3_ gives us the remainder after 68 is divided by 3. Therefore, _68 mod 3_ is *2*.

#### Divide
Similarly, 54321 divided by 10 i.e. _54321 / 10 = 5432_. Observe that the last digit got removed from the original number on dividing by 10. Similarly, _54321 / 100 = 543_. Note that the last two digits got removed from the original number.

Examples:
* _33 divided by 2_ i.e. _33 / 2_ is *16*.
* _68 divided by 3_ i.e. _68 / 3_ is *22*.

### Exponents and Logarithms
Before we look into _exponents_ and _logarithms_, let's take a step back and consider **multiplication**. </br>
Let's consider twenty one multiplied by three:</br>
_21 \* 3_

**Multiplication can be viewed as repeated addition.** As such, twenty one multiplied by three can viewed as adding twenty one three time like so:</br>
_21 \* 3_ = _21 + 21 + 21_ = _63_

Similarly, **exponents can be viewed as repeated multiplication.**</br>
For example;</br>
_21 \* 21 \* 21_ = _21<sup>3</sup>_

In the expression, **_21<sup>3</sup>_**, _21_ is what is known as the **base** and _3_ is what is known as the **exponent**. With the base of *21* and exponent of *7*, we have _21<sup>7</sup>_. This can also be read as _twenty one raise to the power of seven_. An exponent tells us to multiply the base to itself that many number of times. e.g.</br></br>
_21<sup>3</sup>_ = _21 \* 21 \* 21_ = _9261_ </br>
Read as _twenty one raise to the power of three_.

_21<sup>2</sup>_ = _21 \* 21_ = _441_ </br>
Read as _twenty one raise to the power of two_.

_21<sup>1</sup>_ = *21* </br>
Read as _twenty one raise to the power of one_.

_21<sup>0</sup>_ = *1* </br>
Read as _twenty one raise to the power of zero_.</br></br>
**Note**: Any base with an exponent of 0 is equal to 1.

A special form of **exponents** are **square**. For example, _21<sup>2</sup>_ read as _twenty one squared_ means _multiplying a number by itself_.</br>
When we say, _twenty one cubed_, we mean _21<sup>3</sup>_ i.e. _21 \* 21 \* 21_.</br>
Learn and revise more about [Exponents on Khan Academy](https://www.khanacademy.org/math/pre-algebra/pre-algebra-exponents-radicals).

**Exponents** and **Logarithms** are closely related. In many ways, we are sharing the same fact in different ways. **Logarithms** are a way of thinking of exponents in the reverse way. To find the exponent, we'd ask a question of the form: _what do we get when we raise twenty one to the power of three?_, which will give us the answer of *9261*. In contrast, with logarithms, we'd ask a question of the form: _how many twenty one does it take to make 9261?_, which will give us the answer of _3_.

_Whilst exponential expression tells us what we will get if we start with one and keep multiplying the base exponent number of times, logarithmic expressions tell us how many times we will need to keep dividing by the base to get one._</br>
e.g. If we start with *1* and keep multiplying *2* to itself, *4* times, we are describing _2<sup>4</sup>_, which is *16*. Where as if we start with *16* and keep dividing by *2* until we reach *1*, we are describing _log<sub>2</sub> (16)_, which is *4*.

Let's consider a few examples by viewing **exponential expression** and the corresponding **logarithmic expressions** side by side:

Exponents | Logarithms |
--------- | ---------- |
_21<sup>3</sup>_ = *9261* | _log<sub>21</sub> (9261)_ = *3*
_2<sup>3</sup>_ = *8* | _log<sub>2</sub> (8)_ = *3*
_10<sup>5</sup>_ = *100000* | _log<sub>10</sub> (100000)_ = *5*
_3<sup>2</sup>_ = *9* | _log<sub>3</sub> (9)_ = *2*
_2<sup>3</sup>_ = *8* | _log<sub>2</sub> (8)_ = *3*

Learn and revise more [Logarithms on Khan Academy](https://www.khanacademy.org/math/algebra2/exponential-and-logarithmic-functions).

**Asides**:
* To represent really large numbers (think lots of zeroes), in our everyday numbering system, exponents often get used to share this concisely. e.g.
  * _300000000_ could be represented as _3 \* 10<sup>8</sup>_
  * _0.000000015_ could be represented as _15 \* 10<sup>-9</sup>_
* As we will soon learn, computers store information in _binary system_ instead of the everyday, _decimal system_. This means, while talking about information saved on the computer, we are often thinking in terms of _base 2_ (*bi* means "two" in latin) instead of _base 10_ (*deca* means "ten" in latin). More on this later.

### Set theory basics
* A **Set** is a well-defined collection of distinct objects.
  * E.g. {45, 72, 34, 89} is a set of positive integers.
  * On the other hand, {56, 78, 42, 98, 78} is not a set because the integers are not distinct since 78 shows up twice.
  * A set may be *empty* and is mathematically represented as *{}*
* **Intersection of two sets** is a new set constructed by determining *common members between the two sets*.
  * The intersection of A and B, denoted by *A ∩ B*, is the set of all things that are members of *both A and B*.
  * E.g. Intersection of {23, 45, 78} and {42, 56, 23, 98, 45, 31} is {23, 45}
  * E.g. {54, 34, 89} and {90, 45} are *disjoint* since they do not have any members in common.
* **Union of two sets** is a new set constructed by *adding the members of the two sets*.
  * If there are common members in the two sets, they show up only once in the union set.
  * The union of A and B, denoted by *A ∪ B*, is the set of all things that are members of *either A or B*.
  E.g. Union of {23, 42, 56} and {21, 56, 42, 89} is {21, 23, 42, 56, 89}

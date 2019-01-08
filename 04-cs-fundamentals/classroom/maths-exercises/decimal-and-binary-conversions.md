# Decimal to Binary and Binary to Decimal
_CS fundamentals 0_

## Learning Goals
* Understand binary numbering system
* Devise an algorithm to convert from binary numbers to decimal numbers
* Devise an algorithm to convert from decimal numbers to binary numbers

## Activities
* Understand [decimal numbers](#decimal-numbers) in terms of ten unique digits
* Learn about [binary numbers](#binary-numbers)
* Understand how to [convert from binary numbers to decimal numbers](#converting-from-binary-to-decimal) and solve the [exercises](#binary-to-decimal-exercises) that follow.
* Understand how to [convert form decimal numbers to binary numbers](#converting-from-decimal-to-binary) and solve the [exercises](#decimal-to-binary-exercises) that follow.
* [optional] Further Reading exercise: Learn how to convert a decimal number to a binary number and vice versa, as well as [Computer Data Basics](https://docs.google.com/document/d/1g-Dxn1rVTChBs9ZZSOgmohjP_RoWNyPJTE-m_n35aZ0/edit).

## Reading notes and exercises
### Decimal numbers
Decimal numbers or natural numbers are the numbers we use in everyday life. The decimal numbering system has ten distinct unique numbers.
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

### Binary numbers
Binary numbers  have two distinct **Bi**nary dig**its** (or **Bits** for short)
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

### Converting from Binary to Decimal
Before we look at how to convert a binary number like 1101<sub>2</sub> into it's decimal equivalent. Let's breakdown a decimal number that will help us see a pattern and determine an approach.
Let’s consider: 453 in decimal i.e. 453<sub>10</sub>. In everyday world, we assume that we are talking about base 10 numbers i.e. all numbers are assumed to have subscript 10 since we are talking decimal numbers. Here's one way of breaking down 453<sub>10</sub>:</br>
 453<sub>10</sub> = 400 + 50 + 3</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;= (**4** \* 100) + (**5** \* 10) + (**3** \* 1)</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=   3 \* (10<sup>0</sup>)</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  + 5 \* (10<sup>1</sup>)</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  + 4 \* (10<sup>2</sup>)</br>
Now let’s consider a binary number, let’s say: 1101<sub>2</sub>. Binary numbers have the base 2, i.e. subscript 2. With binary numbers (as compared to decimal), we use powers of 2 instead of powers of 10.</br>
**1101**<sub>2</sub> = **1**000 + **1**00 + **0**0 + **1**</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =  1 \* (2<sup>0</sup>)</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  + 0 \* (2<sup>1</sup>)</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  + 1 \* (2<sup>2</sup>)</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  + 1 \* (2<sup>3</sup>)</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = 1 + 0 + 4 + 8 = **13**<sub>10</sub></br>
We just converted 1101<sub>2</sub> to its equivalent decimal number i.e. 13<sub>10</sub></br>

As you noticed above, anything raise to the power of 0 is 1 – independent of the numbering system in use.</br>
0<sub>2</sub> = (0 \* 2<sup>0</sup>) = 0<sub>10</sub></br>
1<sub>2</sub> = (1 \* 2<sup>0</sup>) = 1<sub>10</sub></br>
10<sub>2</sub> = (0 \* 2<sup>0</sup>) + (1 * 2<sup>1</sup>) = 2<sub>10</sub></br>
</br>
_Reminder_: Anything to the power 0 equals 1</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1<sup>0</sup> = 1</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2<sup>0</sup> = 1</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10<sup>0</sup> = 1</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_n_<sup>0</sup> = 1</br>
</br>
To recap, here's how we converted 1101<sub>2</sub> to its decimal equivalent:</br>
1101<sub>2</sub> = (1 \* 2<sup>0</sup>) + (0 \* 2<sup>1</sup>) + (1 \* 2<sup>2</sup>) + (1 \* 2<sup>3</sup>)</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;= 1 + 0 + 4 + 8</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;= 13<sub>10</sub></br></br>

Let's walk through another conversion exercise together. Let's convert 0101<sub>2</sub> to its decimal equivalent. Try this out on your own using the approach we used for 1101<sub>2</sub> above.</br>
**0101**<sub>2</sub> = (1 \* 2<sup>0</sup>) + (0 \* 2<sup>1</sup>) + (1 \* 2<sup>2</sup>) + (0 \* 2<sup>3</sup>)</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;= 1 + 0 + 4 + 0</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;= 5<sub>10</sub></br></br>

#### Binary to Decimal Exercises
Convert the following binary numbers to their decimal equivalent number using the approach we learned above:

1. 
1001<sub>2</sub>
<details>
  <summary> Click here to tally the answer for 1001<sub>2</sub> to decimal </summary>
  1001<sub>2</sub> = (1 * 2<sup>0</sup>) + (0 * 2<sup>1</sup>) + (0 * 2<sup>2</sup>) + (1 * 2<sup>3</sup>)</br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;= 1 + 0 + 0 + 8</br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;= 9<sub>10</sub></br></br>
</details>
</br>

2. 
1010<sub>2</sub>
<details>
  <summary> Click here to tally the answer for 1010<sub>2</sub> to decimal </summary>
  1010<sub>2</sub> = (0 * 2<sup>0</sup>) + (1 * 2<sup>1</sup>) + (0 * 2<sup>2</sup>) + (1 * 2<sup>3</sup>)</br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;= 0 + 2 + 0 + 8</br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;= 10<sub>10</sub></br></br>
</details>
</br>

3. 
1111<sub>2</sub>
<details>
  <summary> Click here to tally the answer for 1111<sub>2</sub> to decimal </summary>
  1111<sub>2</sub> = (1 * 2<sup>0</sup>) + (1 * 2<sup>1</sup>) + (1 * 2<sup>2</sup>) + (1 * 2<sup>3</sup>)</br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;= 1 + 2 + 4 + 8</br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;= 15<sub>10</sub></br></br>
</details>
</br>

4. 
11000011</sub>
<details>
  <summary> Click here to tally the answer for 11000011<sub>2</sub> to decimal </summary>
  11000011<sub>2</sub> = (1 * 2<sup>0</sup>) + (1 * 2<sup>1</sup>) + (0 * 2<sup>2</sup>) + (0 * 2<sup>3</sup>)</br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+ (0 * 2<sup>4</sup>) + (0 * 2<sup>5</sup>) + (1 * 2<sup>6</sup>) + (1 * 2<sup>7</sup>)</br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;= 1 + 2 + 0 + 0 + 0 + 0 + 64 +128</br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;= 195<sub>10</sub></br></br>
</details>

### Converting from Decimal to Binary
To convert a decimal number to it's binary equivalent, you may find it useful to have the powers of 2 table handy.

#### Reference: Powers of 2
2<sup>9</sup> | 2<sup>8</sup> | 2<sup>7</sup> | 2<sup>6</sup> | 2<sup>5</sup> | 2<sup>4</sup> | 2<sup>3</sup> | 2<sup>2</sup> | 2<sup>1</sup> | 2<sup>0</sup>
----|-----|-----|----|----|----|---|---|---|---
512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1

Given a decimal number, here's the steps we'll take to figure out its binary equivalent:
1. Subtract the largest possible power of 2 that is less than the number.
1. Keep subtracting the largest possible power of 2 from the remainder, keeping track of which power of 2 was subtracted and which was not.
1. Continue doing so until there is nothing left to subtract (aka the value is 0)
1. The tracking of powers of 2, which were subtracted and which were not will give us to the binary equivalent number.
Let's illustrate this with an example. Let's consider **453**<sub>10</sub>. Now, find a value in the reference powers of 2 table that is less than 453. 512 is greater than 453. The next smaller power of two, 2<sup>8</sup>, 256 is less than 453. So, we subtract 256 from 453.</br>

```
  453
 -256
 -----
= 197
```

2<sup>9</sup> | 2<sup>8</sup> | 2<sup>7</sup> | 2<sup>6</sup> | 2<sup>5</sup> | 2<sup>4</sup> | 2<sup>3</sup> | 2<sup>2</sup> | 2<sup>1</sup> | 2<sup>0</sup>
----|-----|-----|----|----|----|---|---|---|---
512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1
 0  |  1  |   ? | ?  |  ? |  ? | ? | ? | ? | ?

We repeat the process with the remainder, 197 and continue to keep track of the powers of two. 2<sup>7</sup> i.e. 128 is less than 197. So, we subtract 128 from 197.</br>

```
  197
- 128
 -----
=  69
```
2<sup>9</sup> | 2<sup>8</sup> | 2<sup>7</sup> | 2<sup>6</sup> | 2<sup>5</sup> | 2<sup>4</sup> | 2<sup>3</sup> | 2<sup>2</sup> | 2<sup>1</sup> | 2<sup>0</sup>
----|-----|-----|----|----|----|---|---|---|---
512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1
 0  |  1  |   1 | ?  |  ? |  ? | ? | ? | ? | ?

Next, the 2<sup>6</sup> i.e. 64 is less than the remainder 69, so we subtract 64 from 69 and continue tracking the powers of 2.</br>

```
   69
 - 64
 -----
=   5
```
2<sup>9</sup> | 2<sup>8</sup> | 2<sup>7</sup> | 2<sup>6</sup> | 2<sup>5</sup> | 2<sup>4</sup> | 2<sup>3</sup> | 2<sup>2</sup> | 2<sup>1</sup> | 2<sup>0</sup>
----|-----|-----|----|----|----|---|---|---|---
512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1
 0  |  1  |   1 |  1 |  ? |  ? | ? | ? | ? | ?

Continuing the consider the next power of 2, 2<sup>5</sup> i.e. 32 is greater than the remainder, 5. So, we skip it. Similarly, 2<sup>4</sup> and 2<sup>3</sup> i.e. 16 and 8 are greater than 5, so we skip them as well.</br>

2<sup>9</sup> | 2<sup>8</sup> | 2<sup>7</sup> | 2<sup>6</sup> | 2<sup>5</sup> | 2<sup>4</sup> | 2<sup>3</sup> | 2<sup>2</sup> | 2<sup>1</sup> | 2<sup>0</sup>
----|-----|-----|----|----|----|---|---|---|---
512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1
 0  |  1  |   1 |  1 |  0 |  0 | 0 | ? | ? | ?

 2<sup>2</sup> i.e. 4 is less than the remainder, 5. So, we subtract 4 from 5.</br>

 ```
   5
 - 4
 -----
=  1
```

2<sup>9</sup> | 2<sup>8</sup> | 2<sup>7</sup> | 2<sup>6</sup> | 2<sup>5</sup> | 2<sup>4</sup> | 2<sup>3</sup> | 2<sup>2</sup> | 2<sup>1</sup> | 2<sup>0</sup>
----|-----|-----|----|----|----|---|---|---|---
512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1
 0  |  1  |   1 |  1 |  0 |  0 | 0 | 1 | ? | ?

2<sup>1</sup> i.e. 2 is greater than the remainder, 1. So, we skip it and mark 0 against it's power of 2 consideration.</br>

2<sup>9</sup> | 2<sup>8</sup> | 2<sup>7</sup> | 2<sup>6</sup> | 2<sup>5</sup> | 2<sup>4</sup> | 2<sup>3</sup> | 2<sup>2</sup> | 2<sup>1</sup> | 2<sup>0</sup>
----|-----|-----|----|----|----|---|---|---|---
512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1
 0  |  1  |   1 |  1 |  0 |  0 | 0 | 1 | 0 | ?

Finally, 2<sup>1</sup> is 1, which is the same as our remainder. We subtract it from the remainder to yield 0.</br>
```
   1
 - 1
 -----
=  0
```
2<sup>9</sup> | 2<sup>8</sup> | 2<sup>7</sup> | 2<sup>6</sup> | 2<sup>5</sup> | 2<sup>4</sup> | 2<sup>3</sup> | 2<sup>2</sup> | 2<sup>1</sup> | 2<sup>0</sup>
----|-----|-----|----|----|----|---|---|---|---
512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1
 0  |  1  |   1 |  1 |  0 |  0 | 0 | 1 | 0 | 1

The binary equivalent for **453**<sub>10</sub>, is the number we obtained by keeping track of the powers of 2. This is **0111000101**<sub>2</sub>. (Note: as with decimal numbers, we can get rid of preceding 0s and simply write this as 111000101<sub>2</sub>.)
 </br></br>
Let's put this all together and convert **475**<sub>10</sub> to its binary equivalent. As before, let's leverage our powers of 2 table.</br>

2<sup>9</sup> | 2<sup>8</sup> | 2<sup>7</sup> | 2<sup>6</sup> | 2<sup>5</sup> | 2<sup>4</sup> | 2<sup>3</sup> | 2<sup>2</sup> | 2<sup>1</sup> | 2<sup>0</sup>
----|-----|-----|----|----|----|---|---|---|---
512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1
 ?  |  ?  |   ? |  ? |  ? |  ? | ? | ? | ? | ?

512 is greater than 475, so we mark 0 under its consideration and then subtract 256 from 475 yielding 219 as the remainder. 128 is less than 219. 219 minus 128 is 91. 91 minus 64 is 27. 32 is greater than 27. 27 minus 16 is 11. 11 minus 8 is 3. 4 is greater than 3. 3 minus 2 is 1. 1 minus 1 is 0. Here's what the subtractions and the resulting tracking of powers of 2 table will look like. </br>

```
  475
 -256
 -----
  219
 -128
 -----
   91
 - 64
 -----
   27
 - 16
 -----
   11
 -  8
 -----
    3
 -  2
 -----
    1
 -  1
 -----
    0
```

2<sup>9</sup> | 2<sup>8</sup> | 2<sup>7</sup> | 2<sup>6</sup> | 2<sup>5</sup> | 2<sup>4</sup> | 2<sup>3</sup> | 2<sup>2</sup> | 2<sup>1</sup> | 2<sup>0</sup>
----|-----|-----|----|----|----|---|---|---|---
512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1
 0  |  1  |   1 |  1 |  0 |  1 | 1 | 0 | 1 | 1

The binary equivalent of 475<sub>10</sub> is **111011011**<sub>2</sub>.

#### Decimal to Binary Exercises
Convert the following decimal numbers to their binary equivalent number using the approach we learned above:

* 49
<details>
   <summary>Click here to see the solution for 49</summary>
Using the powers of two table,

2<sup>9</sup> | 2<sup>8</sup> | 2<sup>7</sup> | 2<sup>6</sup> | 2<sup>5</sup> | 2<sup>4</sup> | 2<sup>3</sup> | 2<sup>2</sup> | 2<sup>1</sup> | 2<sup>0</sup>
----|-----|-----|----|----|----|---|---|---|---
512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1
 0  |  0  |   0 |  0 |  1 |  1 | 0 | 0 | 0 | 1

We know that 49<sub>10</sub> is less than all powers of 2 greater than 32. So, we start with subtracting 32 from 49.</br>
   49</br>
 \- 32</br>
 -----</br>
   17</br>
 \- 16</br>
 -----</br>
    1</br>
  \- 1</br>
 -----</br>
    0</br>

The binary equivalent of **49**<sub>10</sub> is **110001**<sub>2</sub>.
</details>
</br>

* 234
<details>
   <summary>Click here to see the solution for 49</summary>
Using the powers of two table,

2<sup>9</sup> | 2<sup>8</sup> | 2<sup>7</sup> | 2<sup>6</sup> | 2<sup>5</sup> | 2<sup>4</sup> | 2<sup>3</sup> | 2<sup>2</sup> | 2<sup>1</sup> | 2<sup>0</sup>
----|-----|-----|----|----|----|---|---|---|---
512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1
 0  |  0  |   0 |  0 |  1 |  1 | 0 | 0 | 0 | 1

We know that 128 is the largest power of two that is smaller than 234.</br>
234</br>
\- 128</br>
-----</br>
106</br>
\- 64</br>
-----</br>
 42</br>
\- 32</br>
-----</br>
 10</br>
\- 8</br>
-----</br>
  2</br>
\- 2</br>
-----</br>
  0</br>

The binary equivalent of **234**<sub>10</sub> is **11101010**<sub>2</sub>.
</details>
</br>

* 432
<details>
   <summary>Click here to see the solution for 49</summary>
Using the powers of two table,

2<sup>9</sup> | 2<sup>8</sup> | 2<sup>7</sup> | 2<sup>6</sup> | 2<sup>5</sup> | 2<sup>4</sup> | 2<sup>3</sup> | 2<sup>2</sup> | 2<sup>1</sup> | 2<sup>0</sup>
----|-----|-----|----|----|----|---|---|---|---
512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1
 0  |  0  |   0 |  0 |  1 |  1 | 0 | 0 | 0 | 1

We know that 256 is the largest power of two that is less than 432.</br>
432</br>
\- 256</br>
-----</br>
176</br>
\- 128</br>
-----</br>
 48</br>
\- 32</br>
-----</br>
 16</br>
\- 16</br>
-----</br>
  0</br>
The binary equivalent of **432**<sub>10</sub> is **110110000**<sub>2</sub>.



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

<b>Key Observations</b>
- While counting in a numbering system with 10 possible digits,
    - We start with the lowest value digit aka *0*.
    - To increase the count, we add one to the lowest digit.
    - To continue the count, we continue adding one to the next digit until we have exhausted all digits.
    - Once we reach the highest value digit i.e. *9*, we reset the lowest significant digit to 0 and increment the digit to its left by 1. This is how we count further from *09* to *10*.

### Binary numbers
Binary numbers  have two distinct <b>Bi</b>nary dig<b>its</b> (or <b>Bits</b> for short)
```
[0, 1]
```
The pattern for counting is the same as with every day natural numbers. Only, instead of 10 possible values for a digit in decimal numbers, we only have two possible values for a digit in binary.
- Start with 0
- Count to the maximum possible value i.e. 1
- Then reset the least significant digit to 0, and increment the digit to its left. This is how we count from *01* to *10*.
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
Here's a table of binary number next to the its equivalent and corresponding decimal number. Observe the patterns in the numbers

Binary    | Decimal
----------|----------------
000<b>0</b>  | 0<b>0</b>
000<b>1</b>  | 0<b>1</b>
00<b>1</b>0  | 0<b>2</b>
0011		 | 0<b>3</b>
0<b>1</b>00	 |	0<b>4</b>
0101		 | 0<b>5</b>
0110		 | 0<b>6</b>
0111		 | 0<b>7</b>
<b>1</b>000  | 0<b>8</b>
1001		 | 0<b>9</b>
1010		 | <b>1</b>0
1011		 | 11
1100		 | 12
 …  		 | …


### Converting from Binary to Decimal
Before we look at how to convert a binary number like 1101<sub>2</sub> into it's decimal equivalent. Let's breakdown a decimal number that will help us see a pattern and determine an approach.
Let’s consider: 453 in decimal i.e. 453<sub>10</sub>. In everyday world, we assume that we are talking about base 10 numbers i.e. all numbers are assumed to have subscript 10. Here's one way of breaking down 453<sub>10</sub>:

453<sub>10</sub></br>
    = 3 + 50 + 400</br>
    = (3 \* <b>1</b>) + (5 \* <b>10</b>) + (4 \* <b>100</b>)</br>
    = 3 \* (<b>10<sup>0</sup></b>) + 5 \* (<b>10<sup>1</sup></b>) + 4 \* (<b>10<sup>2</sup></b>)


Now, let’s consider a binary number, let’s say: 1101<sub>2</sub>. Binary numbers have the base 2, i.e. subscript 2. As compared to decimal numbers where we use powers of 10, with binary numbers, we use powers of 2.

<b>1101</b><sub>2</sub></br>
    = <b>1</b> + <b>0</b>0 + <b>1</b>00  + <b>1</b>000</br>
    =  (1 \* <b>2<sup>0</sup></b>) \+ (0 \* <b>2<sup>1</sup></b>) \+ (1 \* <b>2<sup>2</sup></b>) \+ (1 \* <b>2<sup>3</sup></b>)</br>
    = 1 + 0 + 4 + 8</br>
    = <b>13</b><sub>10</sub></br>

We just converted 1101<sub>2</sub> to its equivalent decimal number i.e. 13<sub>10</sub></br>

As you noticed above, anything raise to the power of 0 is 1. This is independent of the numbering system in use.</br>
0<sub>2</sub> = (0 \* 2<sup>0</sup>) = 0<sub>10</sub></br>
1<sub>2</sub> = (1 \* 2<sup>0</sup>) = 1<sub>10</sub></br>
10<sub>2</sub> = (0 \* 2<sup>0</sup>) + (1 * 2<sup>1</sup>) = 2<sub>10</sub></br>
</br>
_Reminder_: Anything to the power 0 equals 1</br>
* 1<sup>0</sup> = 1</br>
* 2<sup>0</sup> = 1</br>
* 10<sup>0</sup> = 1</br>
* *n*<sup>0</sup> = 1</br>

To recap, here's how we converted 1101<sub>2</sub> to its decimal equivalent:</br>
<b>1101</b><sub>2</sub></br>
    = <b>1</b> + <b>0</b>0 + <b>1</b>00  + <b>1</b>000</br>
    =  (1 \* <b>2<sup>0</sup></b>) \+ (0 \* <b>2<sup>1</sup></b>) \+ (1 \* <b>2<sup>2</sup></b>) \+ (1 \* <b>2<sup>3</sup></b>)</br>
    = 1 + 0 + 4 + 8</br>
    = <b>13</b><sub>10</sub></br>

Let's walk through another conversion exercise together. Let's convert 0101<sub>2</sub> to its decimal equivalent. Try this out on your own using the approach we used for 1101<sub>2</sub> above.</br>
<b>0101</b><sub>2</sub></br>
= (1 \* <b>2<sup>0</sup></b>) + (0 \* <b>2<sup>1</sup></b>) + (1 \* <b>2<sup>2</sup></b>) + (0 \* <b>2<sup>3</sup></b>)</br>
= 1 + 0 + 4 + 0</br>
= <b>5</b><sub>10</sub></br></br>

#### Binary to Decimal Exercises
Convert the following binary numbers to their decimal equivalent number using the approach we learned above:

1. Convert 1001<sub>2</sub> to decimal
    <details>
    <summary> Click here to see the answer for 1001<sub>2</sub> to decimal
    </summary>
    1001<sub>2</sub></br>
     = (1 \* 2<sup>0</sup>) + (0 \* 2<sup>1</sup>) + (0 \* 2<sup>2</sup>) + (1 \* 2<sup>3</sup>)</br>
     = 1 + 0 + 0 + 8</br>
     = 9<sub>10</sub></br></br>
     </details>
     </br>

1. Convert 1010<sub>2</sub> to decimal
    <details>
    <summary> Click here to see the answer for 1010<sub>2</sub> to decimal
    </summary>
    1010<sub>2</sub></br>
    = (0 \* 2<sup>0</sup>) + (1 \* 2<sup>1</sup>) + (0 \* 2<sup>2</sup>) + (1 \* 2<sup>3</sup>)</br>
    = 0 + 2 + 0 + 8</br>
    = 10<sub>10</sub></br></br>
    </details>
    </br>

1. Convert 1111<sub>2</sub> to decimal
    <details>
    <summary> Click here to see the answer for 1111<sub>2</sub> to decimal
    </summary>
    1111<sub>2</sub></br>
    = (1 \* 2<sup>0</sup>) + (1 \* 2<sup>1</sup>) + (1 \* 2<sup>2</sup>) + (1 \* 2<sup>3</sup>)</br>
    = 1 + 2 + 4 + 8</br>
    = 15<sub>10</sub></br></br>
    </details>
    </br>

1. Convert 11000011<sub>2</sub> to decimal
    <details>
    <summary> Click here to see the answer for 11000011<sub>2</sub> to decimal
    </summary>
    11000011<sub>2</sub></br>
    = (1 \* 2<sup>0</sup>) + (1 \* 2<sup>1</sup>) + (0 \* 2<sup>2</sup>) + (0 \* 2<sup>3</sup>) + (0 \* 2<sup>4</sup>) + (0 \* 2<sup>5</sup>) + (1 \* 2<sup>6</sup>) + (1 \* 2<sup>7</sup>)</br>
    = 1 + 2 + 0 + 0 + 0 + 0 + 64 +128</br>
    = 195<sub>10</sub></br></br>
    </details>

### Converting from Decimal to Binary
To convert a decimal number to its binary equivalent, you may find it useful to have the powers of 2 table handy.

#### Reference: Powers of 2
2<sup>9</sup> | 2<sup>8</sup> | 2<sup>7</sup> | 2<sup>6</sup> | 2<sup>5</sup> | 2<sup>4</sup> | 2<sup>3</sup> | 2<sup>2</sup> | 2<sup>1</sup> | 2<sup>0</sup>
----|-----|-----|----|----|----|---|---|---|---
512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1

Given a decimal number, here's the steps we'll take to figure out its binary equivalent:
1. Subtract the largest possible power of 2 that is less than or equal to the number.
1. Keep subtracting the largest possible power of 2 from the remainder, keeping track of which power of 2 was subtracted and which was not.
1. Continue doing so until there is nothing left to subtract (aka the remainder is 0)
1. The tracking of powers of 2, which were subtracted and which were not will give us to the binary equivalent number.

Let's illustrate this with an example. Let's consider <b>453</b><sub>10</sub>. Now, find a value in the reference powers of 2 table that is less than 453. 512 is greater than 453. The next smaller power of two, 2<sup>8</sup>, 256 is less than 453. So, we subtract 256 from 453.</br>

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

The binary equivalent for <b>453</b><sub>10</sub>, is the number we obtained by keeping track of the powers of 2. This is <b>0111000101</b><sub>2</sub>. (Note: as with decimal numbers, we can get rid of preceding 0s and simply write this as 111000101<sub>2</sub>.)
 </br></br>
Let's put this all together and convert <b>475</b><sub>10</sub> to its binary equivalent. As before, let's leverage our powers of 2 table.</br>

2<sup>9</sup> | 2<sup>8</sup> | 2<sup>7</sup> | 2<sup>6</sup> | 2<sup>5</sup> | 2<sup>4</sup> | 2<sup>3</sup> | 2<sup>2</sup> | 2<sup>1</sup> | 2<sup>0</sup>
----|-----|-----|----|----|----|---|---|---|---
512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1
 ?  |  ?  |   ? |  ? |  ? |  ? | ? | ? | ? | ?

512 is greater than 475, so we mark 0 under its consideration.

2<sup>9</sup> | 2<sup>8</sup> | 2<sup>7</sup> | 2<sup>6</sup> | 2<sup>5</sup> | 2<sup>4</sup> | 2<sup>3</sup> | 2<sup>2</sup> | 2<sup>1</sup> | 2<sup>0</sup>
----|-----|-----|----|----|----|---|---|---|---
512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1
 <b>0</b>  |  ?  |   ? |  ? |  ? |  ? | ? | ? | ? | ?


Next, 256 is smaller than 512, and hence, we subtract 256 from 475 yielding 219 as the remainder.
```
  475
 -256
 -----
  219
```
Since we subtracted 256 from 512, we mark 1 for its consideration.

2<sup>9</sup> | 2<sup>8</sup> | 2<sup>7</sup> | 2<sup>6</sup> | 2<sup>5</sup> | 2<sup>4</sup> | 2<sup>3</sup> | 2<sup>2</sup> | 2<sup>1</sup> | 2<sup>0</sup>
----|-----|-----|----|----|----|---|---|---|---
512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1
 0  |  <b>1</b>  |   ? |  ? |  ? |  ? | ? | ? | ? | ?

The next highest power of 2 is 128. 128 is less than 219. We mark 1 for its consideration.

2<sup>9</sup> | 2<sup>8</sup> | 2<sup>7</sup> | 2<sup>6</sup> | 2<sup>5</sup> | 2<sup>4</sup> | 2<sup>3</sup> | 2<sup>2</sup> | 2<sup>1</sup> | 2<sup>0</sup>
----|-----|-----|----|----|----|---|---|---|---
512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1
 0  |  1  | <b>1</b> |  ? |  ? |  ? | ? | ? | ? | ?

```
   219
  -128
  -----
    91
```
219 minus 128 is 91. The next power of 2, 64 is less than 91.

2<sup>9</sup> | 2<sup>8</sup> | 2<sup>7</sup> | 2<sup>6</sup> | 2<sup>5</sup> | 2<sup>4</sup> | 2<sup>3</sup> | 2<sup>2</sup> | 2<sup>1</sup> | 2<sup>0</sup>
----|-----|-----|----|----|----|---|---|---|---
512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1
 0  |  1  | 1 |  <b>1</b> |  ? |  ? | ? | ? | ? | ?

 ```
    91
  - 64
  -----
    27
```
91 minus 64 is 27. The next highest power of 2 not yet considered is 32. 32 is greater than 27. So, we skip 32 by marking it as a 0.

2<sup>9</sup> | 2<sup>8</sup> | 2<sup>7</sup> | 2<sup>6</sup> | 2<sup>5</sup> | 2<sup>4</sup> | 2<sup>3</sup> | 2<sup>2</sup> | 2<sup>1</sup> | 2<sup>0</sup>
----|-----|-----|----|----|----|---|---|---|---
512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1
 0  |  1  | 1 |  1 |  <b>0</b> |  ? | ? | ? | ? | ?

Next, we consider 16. 16 is smaller than 27.

2<sup>9</sup> | 2<sup>8</sup> | 2<sup>7</sup> | 2<sup>6</sup> | 2<sup>5</sup> | 2<sup>4</sup> | 2<sup>3</sup> | 2<sup>2</sup> | 2<sup>1</sup> | 2<sup>0</sup>
----|-----|-----|----|----|----|---|---|---|---
512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1
 0  |  1  | 1 |  1 |  0 |  <b>1</b> | ? | ? | ? | ?

27 minus 16 is 11.
```
   27
 - 16
 -----
   11
```
8, the next power of 2, is smaller than 11.

2<sup>9</sup> | 2<sup>8</sup> | 2<sup>7</sup> | 2<sup>6</sup> | 2<sup>5</sup> | 2<sup>4</sup> | 2<sup>3</sup> | 2<sup>2</sup> | 2<sup>1</sup> | 2<sup>0</sup>
----|-----|-----|----|----|----|---|---|---|---
512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1
 0  |  1  | 1 |  1 |  0 |  1  | <b>1</b> | ? | ? | ?

 ```
    11
  -  8
  -----
     3
```
11 minus 8 is 3.

4 is greater than 3.

2<sup>9</sup> | 2<sup>8</sup> | 2<sup>7</sup> | 2<sup>6</sup> | 2<sup>5</sup> | 2<sup>4</sup> | 2<sup>3</sup> | 2<sup>2</sup> | 2<sup>1</sup> | 2<sup>0</sup>
----|-----|-----|----|----|----|---|---|---|---
512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1
 0  |  1  | 1 |  1 |  0 |  1  | 1  |<b>0</b> | ? | ?

2 is smaller than 3.

2<sup>9</sup> | 2<sup>8</sup> | 2<sup>7</sup> | 2<sup>6</sup> | 2<sup>5</sup> | 2<sup>4</sup> | 2<sup>3</sup> | 2<sup>2</sup> | 2<sup>1</sup> | 2<sup>0</sup>
----|-----|-----|----|----|----|---|---|---|---
512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1
 0  |  1  | 1 |  1 |  0 |  1  | 1  | 0 |<b>1</b> | ?

3 minus 2 is 1.
```
    3
 -  2
 -----
    1
```

1 is equal to 1.

2<sup>9</sup> | 2<sup>8</sup> | 2<sup>7</sup> | 2<sup>6</sup> | 2<sup>5</sup> | 2<sup>4</sup> | 2<sup>3</sup> | 2<sup>2</sup> | 2<sup>1</sup> | 2<sup>0</sup>
----|-----|-----|----|----|----|---|---|---|---
512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1
 0  |  1  | 1 |  1 |  0 |  1  | 1  | 0 | 1 |<b>1</b>

1 minus 1 is <b>0</b>.

```
    1
 -  1
 -----
    0
```
The final table looks like this:

2<sup>9</sup> | 2<sup>8</sup> | 2<sup>7</sup> | 2<sup>6</sup> | 2<sup>5</sup> | 2<sup>4</sup> | 2<sup>3</sup> | 2<sup>2</sup> | 2<sup>1</sup> | 2<sup>0</sup>
----|-----|-----|----|----|----|---|---|---|---
512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1
 0  |  1  |   1 |  1 |  0 |  1 | 1 | 0 | 1 | 1

The binary equivalent of 475<sub>10</sub> is <b>111011011</b><sub>2</sub>.

#### Decimal to Binary Exercises
Convert each of the following decimal numbers to their binary equivalent number using the approach we learned above.

For easy reference, here is the table of powers of two:

2<sup>9</sup> | 2<sup>8</sup> | 2<sup>7</sup> | 2<sup>6</sup> | 2<sup>5</sup> | 2<sup>4</sup> | 2<sup>3</sup> | 2<sup>2</sup> | 2<sup>1</sup> | 2<sup>0</sup>
----|-----|-----|----|----|----|---|---|---|---
512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1
 0  |  0  |   0 |  0 |  1 |  1 | 0 | 0 | 0 | 1

1. Convert <b>49</b> to binary
    <details>
    <summary>Click here to see the solution for 49
    </summary>
    </br>Using the powers of two table, we know that 49<sub>10</sub> is less than all powers of 2 that greater than 32. So, we start with subtracting 32 from 49.</br></br>
    49</br>
    \- 32</br>
    -----</br>
    17</br>
    \- 16</br>
    -----</br>
    1</br>
    \- 1</br>
    -----</br>
    0</br></br>
    The binary equivalent of <b>49</b><sub>10</sub> is <b>110001</b><sub>2</sub>.
    </details>
    </br>

1. Convert <b>234</b> to binary
    <details>
    <summary>Click here to see the solution for 49
    </summary>
    </br>Using the powers of two table, we know that 128 is the largest power of two that is smaller than 234.</br></br>
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
    0</br></br>
    The binary equivalent of <b>234</b><sub>10</sub> is <b>11101010</b><sub>2</sub>.
    </details>
    </br>

1. Convert <b>432</b> to binary
    <details>
    <summary>Click here to see the solution for 49
    </summary>
    </br>Using the powers of two table above, we know that 256 is the largest power of two that is less than 432.</br></br>
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
    0</br></br>
    The binary equivalent of <b>432</b><sub>10</sub> is <b>110110000</b><sub>2</sub>.

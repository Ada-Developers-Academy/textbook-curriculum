# Introduction to Binary & Memory

## Required work before this class

Before this first CS Fundamentals class, please read, view and complete the exercises on the following links:

- [Essential Mathematics for Software Engineers](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/04-cs-fundamentals/classroom/Essential%20Mathematics.md)
- [Computer Data Basics](https://docs.google.com/document/d/1g-Dxn1rVTChBs9ZZSOgmohjP_RoWNyPJTE-m_n35aZ0/edit)
- [Video: Understand how memory addressing works](https://www.youtube.com/watch?v=F0Ri2TpRBBg) by Prof. Abelardo Pardo, University of Sydney
If you have any questions, please email or slack your instructor.

## Learning Goals

- High level understanding of binary numbers
- Algorithm to convert from binary to decimal and vice versa
- High level overview of memory organization on computers
  - Bits
  - Bytes
  - Computer organization: CPU-memory-buses
  - Memory address

## Binary Numbers

Computers work with binary numbers.  Our number system is the _decimal_ system where there are 10 symbols 0-9, and each digit represents that value times a power of 10.

So 135 = (5 * 10<sup>0</sup>) + (3 * 10<sup>1</sup>) + (5 * 10<sup>2</sup>)

Binary numbers work off powers of 2 with two symbols 0 and 1.

So for the binary number 1101

1101<sub>2</sub> = (1 * 2<sup>0</sup>) + (0 * 2<sup>1</sup>) + (1 * 2<sup>2</sup>) + (1 * 2<sup>3</sup>)

When we use subscripts like the 2 in 1101<sub>2</sub> to indicate that the number is a binary number.  Likewise we could use 10 as a subscript for a decimal number. 135<sub>10</sub>

## Bits & Bytes

Computers organize binary digits into units called _Bits_.  A _Bit_ is one binary digit, either a 0 or a 1.  Each _memory cell_ is an electronic circuit which stores one bit of data.  However one bit by it's lonesome isn't terribly useful, so the memory cells are grouped into units of 8, called a _Byte_.  In the early days of computers the smallest unit you could work with on a computer was a byte, but in modern computers bytes are too small, and so the smallest individual unit of memory that you can work with is called a _word_.  That means at each memory address is one word of data, which could be multiple bytes in size.  On a 32-bit platform a Word is usually 4 bytes in size.  

From there bytes are gouped into larger and larger groups.  You may have heard about _Kilobytes_, _Megabytes_, and _Terabytes_ etc.  A KiloByte is 2<sup>10</sup> Bytes or 1024.  A Megabyte is 2<sup>20</sup> Bytes, and so on. 

When you see a system labeled 32-bit or 64-bit, etc that is the number of individual addresses in memory.  So a 64-bit system can have more memory to store information, there are 2<sup>64</sup> different memory addresses and for a 32-bit system there would be 2<sup>32</sup>.

## Why Do Computers Use Binary

The computer provides, what you can think of as a vast array of bytes called the _System Memory_.  The most basic unit of memory is the aforementioned _memory cell_.  When the cell has no electrical charge, it's considered off or 0.  When it does have an electrical charge, it's considered on, or a 1.  

So RAM cells are maintaining an electrical charge to store information.  That is why when you unplug the computer, you lose anything you hadn't saved to long-term storage.  Because each cell either has a charge or doesn't, each cell can only hold one of two values.  

Interestingly as people research [quantum computing](https://www.newscientist.com/article/dn17575-ditching-binary-will-make-quantum-computers-more-powerful/) we might move to a base-5 or more system as each qubits can represent multiple states.  

## Slide Deck

+ Slide Deck used in class</br>
<span xmlns:dct="http://purl.org/dc/terms/" property="dct:title"><a href="https://drive.google.com/file/d/0B__DV26QHsH4YzhFWFVnbEp2akU/view?usp=sharing">A brief introduction to Binary and Memory</a></span> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License</a>.</br>
<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" /></a><br />

## Resources

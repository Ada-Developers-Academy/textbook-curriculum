# Introduction to Binary & Memory

## Prerequisites

Before this first CS Fundamentals lesson, please read, view and complete the exercises on the following items:

- [Essential Mathematics for Software Engineers](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/04-cs-fundamentals/classroom/Essential%20Mathematics.md)
- [Computer Data Basics](https://docs.google.com/document/d/1g-Dxn1rVTChBs9ZZSOgmohjP_RoWNyPJTE-m_n35aZ0/edit)
- [Video: Understand how memory addressing works](https://www.youtube.com/watch?v=F0Ri2TpRBBg) by Prof. Abelardo Pardo, University of Sydney
If you have any questions, please email or slack your instructor.

## Learning Goals

By the end of this lesson you should be able to:

- Explain the core parts of a computer and what they do
- Describe the structure of a computer
- Compare binary numbers to decimal numbers
- Convert between binary and decimal numbers
- Explain why computers use binary numbers
- Algorithm to convert from binary to decimal and vice versa
- Give a high-level overview of memory organization on computers

## Typical Computer Structure

A _Computer_ is a device for storing and processing data according to a series of commands or instructions provided to it.

| Term 	| Definition 	|
|---	|---	|
| Cache 	| A type of very fast memory, close to or on the CPU chip which is used to store information the CPU will likely need to access soon.  It can also be a term for storing information likely to be used in a location which can be quickly accessed.  This technique of pre-staging information likely to be used in proximate locations is called _caching_. 	|
| CPU 	| The **C**entral **P**rocessing **U**nit of a computer.  This is the main processor which executes program instructions, performs arithmetic and coordinates the other components of a computer.  The most basic components include _control unit_ which pulls instructions from memory, executes them and calls on the other typical component the _arithmetic logic unit_ (ALU) which performs arithmetic and logical operations. 	|
| Peripherals 	| External components to a computer which can provide input and/or output.  An example is a monitor or keyboard. 	|
|  	|  	|

## So What Are Binary Numbers

Our number system is the _decimal_ system where there are 10 symbols 0-9, and each digit represents a value (0-9) times a power of 10.

For Example: 135 = (5 * 10<sup>0</sup>) + (3 * 10<sup>1</sup>) + (5 * 10<sup>2</sup>)

Binary numbers work off powers of 2 with two symbols 0 and 1.  A binary number is one or more digits composed of only 0s and 1s, each digit representing a power of two.

For Example: 1101<sub>2</sub> = (1 * 2<sup>0</sup>) + (0 * 2<sup>1</sup>) + (1 * 2<sup>2</sup>) + (1 * 2<sup>3</sup>)

### A Note On Subscripts

When we use subscripts like the 2 in 1101<sub>2</sub> to indicate that the number is a binary number.  Likewise we could use 10 as a subscript for a decimal number. 135<sub>10</sub>

## Bits & Bytes

Computers organize binary digits into units called _Bits_.  A _Bit_ is one binary digit, either a 0 or a 1.  Each _memory cell_ is an electronic circuit which stores one bit of data.  However one bit by it's lonesome isn't terribly useful, so the memory cells are grouped into units of 8, called a _Byte_.  In the early days of computers the smallest unit you could work with on a computer was a byte, but in modern computers bytes are too small, and so the smallest individual unit of memory that you can work with is called a _word_.  That means at each memory address is one word of data, which could be multiple bytes in size.  On a 32-bit platform a Word is usually 4 bytes in size.  

From there bytes are gouped into larger and larger groups.  You may have heard about _Kilobytes_, _Megabytes_, and _Terabytes_ etc.  A KiloByte is 2<sup>10</sup> Bytes or 1024.  A Megabyte is 2<sup>20</sup> Bytes, and so on. 

When you see a system labeled 32-bit or 64-bit, etc that is the number of individual addresses in memory.  So a 64-bit system can have more memory to store information, there are 2<sup>64</sup> different memory addresses and for a 32-bit system there would be 2<sup>32</sup>.

## Why Do Computers Use Binary

The computer provides, what you can think of as a vast array of bytes called the _System Memory_.  The most basic unit of memory is the aforementioned _memory cell_.  When the cell has no electrical charge, it's considered off or 0.  When it does have an electrical charge, it's considered on, or a 1.  

So RAM cells are maintaining an electrical charge to store information.  That is why when you unplug the computer, you lose anything you hadn't saved to long-term storage.  Because each cell either has a charge or doesn't, each cell can only hold one of two values.  

Interestingly as people research [quantum computing](https://www.newscientist.com/article/dn17575-ditching-binary-will-make-quantum-computers-more-powerful/) we might move to a base-5 or more system as each qubits can represent multiple states.  

## Computer Organization

You can think of a modern computer as having one central processing unit (CPU) which does the calculations and manages the sytem, system memory (RAM) and an I/O Bus which connects the computer to other devices, hard drives, printers, network etc.

![computer org](images/computer-system.png)

As programs run information is pulled from memory across a set of wires known as the _system bus_ into storage spaces on the CPU known as registers.  The CPU will perform operations on data in the registers and transfer data back across the system bus to memory.  It will also use the bus to communicate to other components.  The transfer of information to and from RAM is relatively fast, but saving information to long-term storage (think hard drives, disks, DVDs etc), is orders of magnitude slower.

Naturally things are a lot more complicated with each computer having numerous "cores" (CPUs), different levels of memory and a large variety of devices.

<details>
  <summary>If a system is 16-bit how many addressible memory locations can it have?</summary>

  2<sup>16 = 65536
</details>


## Former Slide Deck

- Former Slide Deck used in class</br>
<span xmlns:dct="http://purl.org/dc/terms/" property="dct:title"><a href="https://drive.google.com/file/d/0B__DV26QHsH4YzhFWFVnbEp2akU/view?usp=sharing">A brief introduction to Binary and Memory</a></span> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License</a>.</br>
<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" /></a><br />

## Resources

- [Geeks for Geeks Representing a Binary Number](https://www.geeksforgeeks.org/binary-representation-of-a-given-number/)
- [Khan Academy: Binary Numbers & AP CS](https://www.khanacademy.org/computing/ap-computer-science-principles/computers-101/digital-data-representation/a/bits-and-binary)
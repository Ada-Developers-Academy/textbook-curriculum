# Finite State Machines

People have been struggling with the theory of computation long before computers existed.  Mathematics is a powerful tool and mathematicians have long sought to answer, "What can I compute?"  There are problems that **cannot** be solved computationally and there are problems we cannot solve in a reasonable (non-exponential) amount of time.

The study of this field is called [**Automata Theory**](https://en.wikipedia.org/wiki/Automata_theory).  It's really about what can and cannot be computed and how to represent it.  

We will only touch on the 1st level of Automata theory, **Finite State Machines** (FSMs).  This is one of several ways to model computation, and a good place to start.

## Learning Goals

By the end of this lesson you should be able to:

- Explain what a Finite State Machine (FSM) is
- Identify the languages a FSM can solve
- Design a FSM to solve for a specific language pattern
- Explain what kinds of problems a DFA cannot solve

## What is a Finite State Machine

A Finite State Machine is a relatively simple model of computation.  An FSA is a model of a machine which can be in exactly *one* of a limited (i.e. finite) set of states.  The machine can take in input which causes the machine to change from one state to another.  Moving from one state to another is called a **transition**.  An FSA always has one state in which it starts and one or more states which are valid end-points.  If a FSA takes in input and ends at a valid end-point, the input is considered valid.  Otherwise the input is considered invalid and rejected.  

### Ok That's What it is, why learn about'em

Finite State Machines are used in a wide variety of applications including:

- The design and verification of computer circuits
- The design of communication protocols
- Processing text
- Verifying Regular Expressions
- Developing compilers and interpreters like the Ruby interpreter
- Modeling simple patterns of events, think of the checkout process in bEtsy

FSAs can make an effective tool to help design systems which have a limited number of states, like authenticating into a website, or processing information from an API.

## Definitions

## Writing a State Machine for an Input Pattern

## A State Machine in a Table


## Summary

## Further Concepts

### Nondeterministic Finite State Machines

### Push Down Automata

### Turing Machines

### 

## Exercises


## Resources

- [Free Stamford Course on Finite Automata]()
- [State Machine Design pattern —Part 1: When, Why & How](https://medium.com/datadriveninvestor/state-machine-design-pattern-why-how-example-through-spring-state-machine-part-1-f13872d68c2d)
- [freeCodeCamp - Understanding State Machines](https://www.freecodecamp.org/news/state-machines-basics-of-computer-science-d42855debc66/)

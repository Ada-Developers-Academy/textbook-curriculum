# Conditionals and Methods Review

### Lessons and Activities
- [Compound Conditionals: Truth Tables and Parse Trees](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/01-ruby-fundamentals/compound-and-complex-conditionals.md)
- [Conditional Control Structures](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/01-ruby-fundamentals/conditional-control-structures.md)
- [Methods](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/01-ruby-fundamentals/methods.md)
- [Friendship Note](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/01-ruby-fundamentals/exercises/friendship-note.md)

### Warm-up Exercises

#### 1) `checkends(s)`

Write a method `checkends(s)`, which takes in a string `s` and returns `true` if the first character in `s` is the same as the last character in `s`. It returns `false` otherwise. The `checkends(s)` method does not have to work on the empty string (the string `''`).

```
>>> checkends('no match')
False

>>> checkends('hah! a match')
True

>>> checkends('q')
True

>>> checkends(' ')
True
```

#### 2) `flipside(s)`

Write a method `flipside(s)`, which takes in a string `s` and returns a string whose first half is `s`'s second half and whose second half is `s`'s first half. If `s.length` (the length of s) is odd, the first half of the input string should have one fewer character than the second half. (Accordingly, the second half of the output string will be one shorter than the first half in these cases.) 

```
>>> flipside('homework')
workhome

>>> flipside('carpets')
petscar
```

#### 3) `rock_paper_scissors`

Write a method `rock_paper_scissors` that runs a game of rock paper scissors between a player and a computer and returns the winner.

The `rock_paper_scissors` should call a separate method called `game_input`. `game_input` is a method that determines the value for the player ("rock", "paper", or "scissors") by getting user input and randomly chooses valye for the computer.

Before you begin, write pseudocode to outline your methods.

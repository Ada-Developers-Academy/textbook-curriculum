# Welcome To Ruby!

We're going to start working with Ruby! Ruby is a programming language and will be the foundation of most everything we learn for the next 3 months.

Like learning any new language, getting good at Ruby will just take practice. You'll find over time that there's nothing "magic" about programming - you're issuing commands that a computer understands and can execute.

## The History of Ruby

Ruby is different than other programming languages. It was written with the human in mind, rather than the computer. Its creator, Yukihiro Matsumoto, wanted to create a programming language that was fun for programmers.

Ruby was first written in 1993 by Yukihiro "Matz" Matsumoto. Many of the design concepts were taken from Perl and SmallTalk. One of the unique things about Ruby is the core cultural principles associated with the language, much of which was influenced by Matz.

## Ruby is for People

> "I hope to see Ruby help every programmer in the world to be productive, and to enjoy programming, and to be happy. That is the primary purpose of Ruby language."

A well-written line of Ruby code can be read aloud, and a non-programmer should be able to understand it.

In the Ruby community, we try to focus on the people, not the machines.

> Often people, especially computer engineers, focus on the machines. They think, "By doing this, the machine will run fast. By doing this, the machine will run more effectively. By doing this, the machine will something something something." They are focusing on machines. But in fact we need to focus on humans, on how humans care about doing programming or operating the application of the machines.

![MINASWAN](https://pbs.twimg.com/media/B2575XuCIAE4BNB.jpg)

## Ruby Community

+ *.rb <- New!
+ [Railsbridge](http://www.railsbridge.org/) & [Rails Girls](http://railsgirls.com/)
+ [Seattle.rb](http://www.seattlerb.org/)
+ Twitter
  + [\#fridayhug](https://twitter.com/hashtag/fridayhug)
  + [\#rubyfriends](https://twitter.com/hashtag/rubyfriends)

## What is it about Ruby?
A couple of ideas that you may notice being different from other programming languages you may have tried:

- Object Oriented Programming (OOP): the concept of "Objects" that have data fields to represent ideas within the program
- Inheritance & Mixins: objects can be parents, children, and siblings of other objects.
- Duck typing: the program infers the type of an argument or variable __When I see a bird that walks like a duck and swims like a duck and quacks like a duck, I call that bird a duck.__
- Flexible syntax: there are many solutions to most problems, with an emphasis on clarity and low cognitive load.


## `irb`
Ruby can be directly executed from your terminal using IRB (**I**nteractive **R**u **b**y). `irb` is be a helpful tool for learning, quick computations, documentation, and debugging problems.

### Do the Ruby with `irb`
From the command line, enter `irb`. Once you're in irb, try inputting a string, like `"hello world"`.

__Question: What happened???__

Did we just write the world's shortest “Hello World” program? Not exactly. The second line is just IRB’s way of telling us the result of the last expression it evaluated. If we want to print out “Hello World” we need a bit more.

### Free calculators for everyone!
Try doing some arithmetic in `irb`:

- 2 + 3
- 2 * 3
- 2 ** 3
- 4/3
- 4/3.0
- "*" * 80
- "hi" + 3
- 10 % 2
- 10 % 11

### Variables & Values
A **variable** is a placeholder for a value. It's like a little post office box - it can hold a number, a string, a piece of code. It doesn't care how big a thing you put inside it, but you can only put one thing in it at a time.

```ruby
dog = "adorable"
house = 10
b = 4 * 2
a = 3 + 2
a = b
```

### Objects & Methods
We have used a lot of methods up to this point, and we didn't even know it!

In the `Math.sqrt(9)` example, `Math` is an object and `sqrt` is the name of a method. We will talk about objects __a lot__ soon. For now, let's focus on the idea that we __call__ the `sqrt` method in the `Math` __object__ with the __parameter__ value _9_.

`gets.chomp` is another example where we were using a method. In this case, we __call__ the `chomps` method with no __parameters__ on the user input that is provided by `gets`.

As we continue on, we will use a lot of methods. Pretty soon, we'll be defining and using our own methods!

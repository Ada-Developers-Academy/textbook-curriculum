# `Enumerable`s Jigsaw

## Format

In this activity, we will be learning and then teaching each other, in the format of two rounds: the research round and the teaching round.

In the research round, you will meet with your first assigned group to learn about an assigned topic.

In the teaching round, your research round group will disseminate and you will go into your a second assigned group. It is your responsibility to teach this group about that topic.

## What to Research

You will be learning and teaching each other about other `Enumerable` methods besides `map`.

### Where to Start

You will want to start [with the official Ruby docs for `Enumerable`](https://ruby-doc.org/core/Enumerable.html#method-i-map). You will want to answer the questions:

1. What does this method do on a high level?
1. What does it return?
1. What does the code block do?
1. What kind of syntax does it require?
1. What does a code example look like?

### Methods

1. `reduce`
1. `all?` & `any?`
1. `select` & `reject`
1. `uniq` & `sum`
1. `min`, `max`, `min_by`, & `max_by`
1. `sort_by`

#### Nota Bene: `<=>` or Spaceship Operator

In some of this documentation, you might see things that use the `<=>`, or spaceship operator. We don't expect you to dive into this detail at the moment. However, here is a brief summary of that operator:

How do programming languages compare two objects to each other? Given `a` or `b`, which is _greater_? Which is _lesser_? When are `a` and `b` _equal to each other_? These are questions programmers are concerned with when comparing two objects, and comparison between two objects happens during sorting.

The `<=>` operator gives a shortcut to evaluating the relationship between `a` and `b` in terms of either `-1`, `0`, or `1`. Consider the line of ruby code:

```ruby
a = 10
b = 200
a <=> b
```

The last line will return a `-1` to signify that `a` is _less than_ `b`.

For more details, feel free to reference more detail online, such as [this Stack Overflow article](https://stackoverflow.com/questions/827649/what-is-the-ruby-spaceship-operator).

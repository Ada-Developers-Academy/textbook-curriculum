# Inheritance Idioms

## Learning Goals

By the end of this lesson, students should be able to...
- Define the term _abstract class_
- Identify and implement _template methods_

## Introduction

There are many common patterns around how inheritance is used in real software projects that are worth studying explicitly. Today we will discuss two of these: _abstract classes_ and _template methods_.

### What is an Idiom?

In the context of software, the word "idiom" means much the same thing as in regular English:

> A style or form of artistic expression that is characteristic of an individual, a period or movement, or a medium or instrument<br>
> -- <cite>[Miriam Webster](https://www.merriam-webster.com/dictionary/idiom)</cite>

In essence, a software idiom is a pattern or style of programming that is commonly used, but which isn't necessarily obvious from the syntax of the language.

For an example of an idiom that doesn't involve inheritance, consider the `map` method. Originally most programming languages did not contain a method named `map` - if you wanted to do that work, you would have to write it yourself:

```ruby
# Map without map
original = [1, 2, 3]
result = []

original.each do |item|
  result << 2 * item
end
```

Over the years programmers repeated this pattern over and over, to the point that "mapping" was a thing you could do without thinking about it. If you were to say something like "map this to that", people would know what you were talking about, even though there was nothing in the programming language called `map`. At this point, `map` had become an idiom.

If an idiom becomes common enough, language designers will take note and include formal support for that pattern in their languages. The language LISP included something similar to `map` as far back as 1959, but most mainstream languages did not support `map` officially until between 2005 and 2010.

### Abstract Classes

### Template Methods

## Summary

## Additional Resources
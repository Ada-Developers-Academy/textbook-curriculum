# Inheritance Idioms

## Learning Goals

By the end of this lesson, students should be able to...

- Define the term _abstract class_
- Identify and implement _template methods_

## Introduction

There are many common patterns around how inheritance is used in real software projects that are worth studying explicitly. Today we will discuss two of these: _abstract classes_ and _template methods_. Both these patterns are used to better tie together parent and child classes.

### What is an Idiom?

In the context of software, the word "idiom" means much the same thing as in regular English:

> Idiom: A style or form of artistic expression that is characteristic of an individual, a period or movement, or a medium or instrument<br>
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

The two idioms we will discuss today do not have language support in Ruby (though they do in other languages), but they are no less important for that.

### Abstract Classes

Again, let us begin with a definition:

> Abstract: disassociated from any specific instance<br>
> -- <cite>[Miriam Webster](https://www.merriam-webster.com/dictionary/abstract)</cite>

An _abstract class_ is a class that is never instantiated. Instead, it serves as the parent class for some number of child classes, which are instantiated.

Returning to our example from [the previous lesson](object-inheritance.md), `Property` could be considered an abstract class.

### Template Methods

One final definition:

> Template: something that establishes or serves as a pattern<br>
> -- <cite>[Miriam Webster](https://www.merriam-webster.com/dictionary/template)</cite>

A template method, then, would be a method that establishes the pattern for a class.

A template method is a method that is intended to be overridden by a subclass.

If a superclass includes a template method, it will do one of two things:
- If there is a reasonable default behavior for this method, the superclass will do that. You only need to override the method if you want some other behavior.
- If there is not a reasonable default, the superclass's version of the method will raise a special exception: `NotImplementedError`. Any subclass will need to implement the method.

```ruby
# Example using Property, with both types of template method
```

Template methods are an extremely common pattern in real-world software projects. Be on the lookout for them in both Rails and React.

## Summary

Vocabulary

| Term             | Definition                                                                                |
| ---------------- | ----------------------------------------------------------------------------------------- |
| idiom (software) | A common pattern used by programmers. Not always obvious from the syntax of the language. |
| abstract class   | A class that is not instantiated, but instead serves as a parent class.                   |
| concrete class   | A class that is instantiated. May or may not inherit from some other class.               |
| template method  | A method that is intended to be overridden in a subclass.                                 |

## Additional Resources

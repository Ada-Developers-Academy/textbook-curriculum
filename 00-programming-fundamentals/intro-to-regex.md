# Introduction to Regular Expressions
## Learning Goals
Be able to answer the following questions:  
- What is a regular expression?
- How can I write a regular expression to match on a specific pattern?


## Introduction  

Regular expressions are a great tool for working with text. Using regular expressions (AKA Regex) you can identify and process patterns of text. Many people find regular expressions difficult to understand and use, but they can make a variety of tasks much easier, like validating that a phone number or zip code is in the right format.

You will likely only use a limited number of expressions during your time at Ada, but understanding Regex can simplify your code, and Regex is useful across multiple languages.

## Regular Expression Basics

Like String and Integer, a regular expression is a data type in Ruby, defining a pattern of characters.  

You can form a Regex variable like this:

```ruby
pattern = /snoopy/
```

`/snoopy/` is a RegEx literal representing a pattern matching any String with the letters "snoopy" inside it.  You can test a String against the regular expression with the Regex's `match` method.  The `match` method compares the string to the pattern, character-by-character and will return a `MatchData` object upon a match and `nil` if the String does not match the pattern.  It's important to note that `match` will return a `MatchData` object if any substring matches the pattern, not necessarily the entire String.

For example:

```ruby
pattern = /snoopy/
if pattern.match("snoopy cartoon")
  puts "The String has snoopy in it!"
else
  puts "It doesn't match"
```
The above snippet will print out "The String has snoopy in it!"  Regular Expressions can also be compared using the `=~` operator.  For example:  `if pattern =~ 'snoopy'`.  However this patter will match, "I love snoopy." and "snoopy is the best peanuts character", and "snoopy".  However these patterns require the String have these exact characters.  What if you wanted to match either "Snoopy" or "snoopy."  To handle this we can use Character sets.

## Character Sets

A **character set**, also called a **character class** is a way to tell the regex engine to match only one out of several characters.  We define a character set with square brackets.  For example `/[Ss]/` will match both capital and lowercase S.  Combining the character set with the previous larger literal, `[Ss]noopy` will match both "Snoopy" and "snoopy".  

You can also adjust the character set to accept a range of characters.  For example:  `/[A-Z]/`  will accept a single character in the range A to Z (must be capitalized), while `/[0-9]/` will accept a single digit.  If you wanted to accept any alphabetic characters you could use `/[A-Za-z]/`.


**Question:** How could you match any alphanumeric digit?  [Click here to see a solution.](https://gist.github.com/CheezItMan/2d445458f7c25eee37f5fd5b212077f4)


## Wildcards

Often you'll want characters that can repeat.  For this there are several helpful symbols, called wildcards, to use.  Wildcards in Regex indicate how often a pattern can appear in matching strings.  The plus (+) symbol indicates one or more instances, while the asterix (*)  indicates zero or more instances and the question mark (?) indicates token is optional in that it might appear once or not at all.

| Wildcard Character | Meaning |
| --- | --- |
|  *  |  Matches if the preceeding token occurs zero or more times.  For example `/[0-9]*/` matches zero or more digits so "",  "123", and "5" would match. |  
|  +  |  Matches if the preceeding token occurs one or more times.  For example `/[0-9]+/` matches one or more digits so both "1" and "345" would match.  |
|  ?  |  Marks the preceeding token optional.  So `/example[0-9]?/` matches "example" followed by one or no digits, thus "example", "example1" and "example13" all match.  |


Examples:  

-  `/[0-9]+/` - Matches one or more digits
-  `/[A-Z]*/` - Matches zero or more capital letters.
-  `/[a-z_][A-Za-z0-9]*/`  - Matches a lower case letter or underscore followed by zero or more alphanumeric characters.  

## Escape characters

There are lots of characters that have special meanings in a Regex (such as the + or * characters).  Just like Strings you can use the backslash character to select the exact character in the text.  It can also be used as a shortcut for common classes of characters.

Some examples include:

| Escape Character |  |  
| --- | --- |
| \n  |  newline character |
| \s  |  Any whitespace character (space, tab, newline) |
| \S  |  Any non-whitespace character |
| \d  |  Any digit |
| \D  |  Any non-digit |
| \\., \\+, \\*  | The literal character following the backslash  |


### Practice

See if you can write a regular expression for these patterns:

1. A 5 digit number
2. A valid local variable name in Ruby.
3. 

## Grouping

## Regex Special Characters

| Character | Name  |  Description |
| --- | --- | --- |
|   \	|   Backslash	|   The backslash gives special meaning to the character following it. For example, the combination "\n" stands for the newline, one of the control characters. 	|
|   ^	|   Caret	|   The caret is the start of line anchor or the negate symbol.  Example: "^a" matches "a" at the start of a line.  Example: "[^0-9]" matches any non digit.	|
|   $	|   Dollar	|   $ the dollar is the end of line anchor.	|
|   {}	|   Curly Braces	|   { } the open and close curly bracket are used as range quantifiers.	|
|   []	|   Square Brackets	|    Open and close square bracket define a character class to match a single character.	|
|   ()	|   Parentheses 	|   The open and close parenthesis are used for grouping characters	|
|   .	|   Dot	|   the dot matches any character except the newline.	|
|   *	|   Star	|   The star is the match-zero-or-more quantifier.	|
|   +	|   Plus	|   The plus is the match-zero-or-one quantifier.	|
|   ?	|   Question Mark	|   The question mark	 is the match-one-or-more quantifier.	|
|   &#124;	|   Pipe	|   The vertical pipe separates a series of alternatives.	|
|  < > 	|   Anchors	|   The smaller and greater signs are anchors that specify a left or right word boundary.	|
|  - 	|   Minus	|   the minus indicates a range in a character class (when it is not at the first position after the "[" opening bracket or the last position before the "]" closing bracket. For example "[A-Z]" matches any uppercase character.	|
| & | Ampersand | The and is the "substitute complete match" symbol. |



## Resources
-  [Regex in Wikipedia](https://en.wikipedia.org/wiki/Regular_expression)
-  [Regular Expressions in rubylearning.com](http://rubylearning.com/satishtalim/ruby_regular_expressions.html)
-  [Regexpal](http://regexpal.com.s3-website-us-east-1.amazonaws.com/?_ga=2.249565263.813004562.1495485737-848749570.1493938714) - A useful tool for composing Regular Expressions

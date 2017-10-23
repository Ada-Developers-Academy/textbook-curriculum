
# Regex Practice

## Matching Patterns

Write a regular expression which would match the patterns on the left, but not the right.

You can use [Regexpal](http://www.regexpal.com/) to craft Regular a Expression and compare it to sample text.

|  Matching Strings  |  Non-Matching Strings |  Answer  |
|  ---  |  ---  | --- |
| aba, ababa, ababa | a, aaba, ba |  |
| can, man, fan | dan, ran, pan |  |
| abcde, zx231, 55723 | dan, a, 123, ada lovelace |
| ada445ada, snoopy has 445 fans | 445, ada, snoopy has 45 fans |  |
| ada_student_list.pdf, ada_personel.pdf, ada_textbook.pdf| ada_files.pdf.tmp, files.pdf |  |

## Practical Regex
1.  Write a regex for a time string like, "13:00:25".
2.  Write a regex for US Zip Code including the optional 4 digit segment.  Examples include 75007-1234 and 98161
3.  Write a regex for a date in the mm/dd/yyyy format.
4.  Write a regex to validate a social security number.
5.  Washington State Driver's license is formatted to start with 1-7 alphabetic (capitalized) characters followed by 5 characters which can be capital letters, numbers or "*".  Create a regex to validate a Washington Driver's license.

## Creating Passing Strings

Create a string which passes the following Regex:

1.  `/.+\.(com)`
2.  `/a{2,4}b{0,4}c{1,2}/`
3.  `/^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$/`
4.  `/[a-z][\.\?!]\s+[A-Z]\./`
5.  `(https?:)\/\/[a-z]+\.[a-z]+\.com`

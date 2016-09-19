## Specificity Examples: Test Yourself

It’s easier to calculate the specificity using the first method. Let’s find out, how it actually is done.

| Question | Selector     | Specificity
| :------------- | :------------- | :------------- |
| 1      | * { }  |    |
| 2      | li.cool { }  |    |
| 3      | li { }  |    |
| 4      | li:first-line { }  |    |
| 5      | ul li { }  |    |
| 6      | ul ol+li { } |    |
| 7      | h1 + *[rel=up] { } |    |
| 8      | ul ol li.red { } |    |
| 9      | li.red.level { } |    |
| 10     | style=”” |    |
| 11     | p { } |    |
| 12     | div p { } |    |
| 13     | .ada { } |    |
| 14     | div p.ada { } |    |
| 15     | #grace { } |    |
| 16     | body #grace.ada p { } |    |

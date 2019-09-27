## Specificity Examples: Test Yourself

Given the following selectors:
- Determine what the selector is targeting
- Order them and rank them from least specific to most specific (or determine the specificity score of each)

Feel free to use a [specificity calculator tool](https://specificity.keegan.st/) to check your answer.

| Label | Selector     | Rank/Point Value from Calculator
| :------------- | :------------- | :------------- |
| A     | `* { }`  |    |
| B     | `li.cool { } ` |    |
| C     | `li { }`  |    |
| D     | `li::first-line { }`  |    |
| E     | `ul li { }`  |    |
| F     | `ul ol+li { }` |    |
| G     | `ul ol li.red { }` |    |
| H     | `li.red.level { }` |    |
| I     | inline-style (no point value) |    |
| J     | `p { }` |    |
| K     | `div p { }` |    |
| L     | `.ada { }` |    |
| M     | `div p.ada { }` |    |
| N     | `#grace { }` |    |
| O     | `body #grace.ada p { }` |    |

<!-- Answers, from least specific to most specific:
0: A
1: C, J
2: D, E, K
3: F
10: L
11: B
12: M
13: G
21: H
100: N
112: O
I
 -->

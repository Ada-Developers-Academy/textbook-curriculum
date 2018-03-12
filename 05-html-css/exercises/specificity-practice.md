## Specificity Examples: Test Yourself

Given the following selectors:
- Determine what the selector is doing
- Order them and rank them from least specific to most specific

Feel free to use a [specificity calculator tool](https://specificity.keegan.st/) to check your answer.

| Label | Selector     | Rank
| :------------- | :------------- | :------------- |
| A     | `* { }`  |    |
| B     | `li.cool { } ` |    |
| C     | `li { }`  |    |
| D     | `li::first-line { }`  |    |
| E     | `ul li { }`  |    |
| F     | `ul ol+li { }` |    |
| G     | `h1 + *[rel=up] { }` |    |
| H     | `ul ol li.red { }` |    |
| I     | `li.red.level { }` |    |
| J     | `style=""` |    |
| K     | `p { }` |    |
| L     | `div p { }` |    |
| M     | `.ada { }` |    |
| N     | `div p.ada { }` |    |
| O     | `#grace { }` |    |
| P     | `body #grace.ada p { }` |    |

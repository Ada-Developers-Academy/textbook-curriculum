# Admissions Program

![waves](../images/waves.jpg)

This exercise will be good for you if you want more practice with:
- creating logical boolean statements
- Ruby conditional syntax
- constructing code from a word problem
- debugging complex scenarios

Wild Waves Theme Park needs a program for its admission booths. When visitors to the park come up to the booth to
purchase their tickets, a worker uses this program to figure out how much to charge them. You will write
this program.

## Wave 1
There is one ticket price of $30.00. Senior citizens (age ≥ 65) are given a 50% discount. Write this program as follows.  Declare the needed variables (the person’s age, the base price of a ticket ($30) and the price you will charge). Input the user’s age, compute the price of the ticket and output the result in a formatted way (that is, using a $).  Ensure that the age entered is **valid** (whatever that means to you).

Run your program a few times, asking the user for different ages such as 10, 50, 65, 80 and 0.

## Wave 2
The park wants to add further alterations to ticket costs. Children **under** 5 are free. Ticket prices are now $30 unless the person lives in King County in which case the tickets are $40. Senior citizens still receive a 50% discount regardless of their county of residence. There are two input parameters now, one for age and one for county. Calculate and output the ticket price. Ticket prices should be either 0, $15, $20, $30 or $40 depending on the person’s age and location. Ensure that the comparison to the county is [case-insensitive](https://en.wiktionary.org/wiki/case_insensitive).

Run your program a few times, asking the user for different age and county combinations.

## Wave 3
The park wants to add further alterations to ticket costs. Children under 14 from Snohomish County get an 18% discount (from the base price of $40) and senior citizens (>= 65) from Skagit County get an additional 7.5% discount over their senior citizen discount.

As this is a challenging set of logic, you might want to write down on paper all the conditions, how to determine each one and how to compute the cost. Also, make sure you have commented your code well.

When done, fill in the expected values in the table below. Then run the code to determine the actual price. Keep debugging until the expected values are the same as the actual values.

| Run # | County     | Age  | Expected Price  | Actual Price  |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| 1       | Chelan       | 12 |   |   |
| 2      | Chelan      | 72  |   |   |
| 3       | Kitsap       | 2 |   |   |
| 4       | King      | 0 |   |   |
| 5       | Snohomish       | 35 |   |   |
| 6       | Pierce       | 4 |   |   |
| 7       | King       | 24 |   |   |
| 8       | Skagit       | 65 |   |   |
| 9       | Snohomish       | 10 |   |   |
| 10       | Skagit       | 21 |   |   |
| 11       | Chelan       | -15 |   |   |
| 11       | Kitsap       | 13 |   |   |

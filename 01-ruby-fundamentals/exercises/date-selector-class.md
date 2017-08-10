# Date Selector

This exercise will be good for you if you want more practice with:
- creating a class
- creating methods
- passing values as parameters

## Requirements
Build a `DateSelector` class that handles all the logic to identify and constrain a date period to day, week, month, or year. You will need to use the Ruby docs on the `Date` class to guide you through this exercise.

The date selector **constructor** should accept `date` and `period` parameters. Assume date is a `Date` object. Period is a symbol that must be one of `:day, :week, :month, :year`. If it is not, the constructor should raise an `ArgumentError`.

The class should define the following instance methods:
- A `start` method that returns the date of the first day of the period.
  - A day starts on the day given.
  - A week starts on the Monday that is or is just before the date.
  - The month is the first day of the month.
  - The year does not change.
- An `end` method that returns the date of the last day of the period.
  - A day ends on the day given.
  - A week ends on the Sunday that is or is just after the date.
  - Though not always true, you can assume a month has 31 days.
  - The year does not change.
- Attributes `date` and `period`.
- A `range_text` method that returns a string for the range in the following formats:
    - For a day: “11/19/2015”
    - For a week: “Week ending 11/22/2015”
    - For a month: “November 2015”
    - For a year: “2015”

## Optional Requirements
The above description of the `end` method for a month allows you to make an assumption about when the month ends. Update this logic to ensure that the month ends on the **correct** date for that month.

# Date Selector

This exercise will be good for you if you want more practice with:
- creating a class
- creating methods
- passing values as parameters

## Requirements
Build a `DateSelector` class that handles all the logic to identify and constrain a date period to day, week, month, or year.


### Wave 1
The date selector **constructor** should accept `date` and `period` parameters. Assume date is a `Date` object. Period is a symbol that must be one of `:day, :week, :month, :year`. If it is not, the constructor should raise an `ArgumentError`.

The class should define the following instance methods:
- A start method that returns the date of the first day of the period. A day starts on the day given. A week starts on the Monday that is or is just before the date.
- An end method that returns the date of the last day of the period. A day ends on the day given. A week ends on the Sunday that is or is just after the date.
- Attributes date and period.
- A range_text method that returns a string for the range in the following formats:
    - For a day: “11/19/2015”
    - For a week: “Week ending 11/22/2015”
    - For a month: “November 2015”
    - For a year: “2015”


### Wave 2
Enhance the date selector to constrain the period within a maximum and minimum date.

- Update the constructor to include `first_date` and `last_date` parameters.
- Constrain the start and end dates such that they fall within the range:
    - A day must be between `first_date` and `last_date`, inclusive.
    - A week must be the nearest complete week starting on or after `first_date` and ending on or before `last_date`.  If there is less than a week between the two then it must be the first complete week on or after `start_date`.
    - A month must be the nearest complete month starting on or after `first_date` and ending on or before `last_date`. If there is less than a month between the two then it must be the first complete month on or after `start_date`.
    - A year must be the nearest complete year starting on or after `first_date` and ending on or before `last_date`. If there is less than a year between the two then it should be the year containing `last_date`.
    - Add a `complete?` method that returns true if the period selected is entirely contained between `first_date` and `last_date`, inclusive.

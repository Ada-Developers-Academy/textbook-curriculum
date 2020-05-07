# "M, V, or C" Activity and More Rails

Today we are going to review the MVC paradigm and review database seeds and logic in the model, particularly as they pertain to the Ride Share Rails project.

For this discussion, think of your instructor as a mediator and guide, rather than as a lecturer. You are encouraged to do the following:

* Whenever possible, you should use voice.
* You should pose questions to the group, not the instructor.
* Similarly, you are encouraged to answer questions, with the instructor available to correct misconceptions and provide answers when no one else has an answer.
* Say something, even if you think you might be wrong! (Nobody throws a frisbee well on their first try)
* When discussing code, you are encouraged to use VS Code Liveshare, and or screen sharing through zoom.
* Take notes!

## Materials
* [What is Ruby on Rails? The MVC Pattern: Model View Controller](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/08-rails/what-is-ruby-on-rails.md#the-mvc-pattern-model-view-controller)
* [Database Seeds](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/08-rails/db-seeds.md)
* [Logic in the Model](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/08-rails/model-logic.md)

## M, V, or C Activity

Rails asks us to follow the MVC design pattern. However, it's challenging to keep track of what features deal with Models, Views, or Controllers sometimes!

As we deepen our Rails learning, let's revisit MVC definitions.

### Setup

Every individual will need a way to indicate "M", "V", or "C" at a given time.

We recommend using 3 index cards: one that says "M," one that says "V," and one that says "C."

Other options include:
- Typing it into the chat
- Using your voice
- Using hand gestures

This exercise was originally written for groups of 4, so if necessary, create smaller groups.

### Instructions

1. Have a group member read the question out loud.
1. Each individual should choose from the "M", "V", or "C" card and place it face down in front of them.
1. On the count of three, everyone in the group should flip over their card.
1. Discuss their responses. They should:
    - Come to a jury-like consensus
    - Why is the right answer right, compared to the other answers?

### Questions

Assume we are working with a Rails application used to look up data about farmers markets.

In this Rails app, we keep track of markets, their related vendors, products, and orders.

A market has many vendors. A vendor has many products. An order keeps track of purchase information, such as the product and vendor.

Where would you put the code that...

1. Creates a form to edit a vendor's name?
2. After a vendor is created successfully, shows the user a list of all vendors?
3. Totals the $ amount of all orders for a specified product?
4. Retrieves a list of all orders that occurred within a specific date range?
5. Allow a user to enter form fields again when a form error occurs?
6. Assuming the database stores money in cents, formats the money to display in dollars?

### Answers

For instructors: [the answers to this activity are here](https://github.com/Ada-Developers-Academy/Teachers-Edition-Textbook/blob/master/09-intermediate-rails/mvc-activity.md).

## Reviewing Rails: Prompts
You are encouraged to copy these questions into a document and take notes during the discussion.

1. What questions do we have on using database seeds?
1. How do we use database seeds in our Ride Share Rails project?
1. What questions do we have on moving business logic into the model layer?
1. How could we make sure we have our business logic in our models in Ride Share Rails?

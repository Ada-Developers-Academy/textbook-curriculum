# Active Record Validations & Ride Share Rails

Today we are going to be discussing the MVC pattern, and how views, controllers, and routes are implemented in Ruby on Rails. 

For this discussion, think of your instructor as a mediator and guide, rather than as a lecturer. You are encouraged to do the following:

* Whenever possible, you should use voice.
* You should pose questions to the group, not the instructor.
* Similarly, you are encouraged to answer questions, with the instructor available to correct misconceptions and provide answers when no one else has an answer.
* Say something, even if you think you might be wrong! (Nobody throws a frisbee well on their first try)
* When discussing code, you are encouraged to use VS Code Liveshare, and or screen sharing through zoom.
* Take notes!

## Materials
* [Active Record Validations](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/08-rails/active-record-validations.md)
* [Ride Share Rails](https://github.com/Ada-C13/ride-share-rails)

## Prompts
You are encouraged to copy these questions into a document and take notes during the discussion.

### Active Record Validations

Assume we have the following code:

```ruby
# app/models/book.rb
class Book < ApplicationRecord
  validates :title, uniqueness: true
  validates :last_name, presence: true
  validates :description, length: { maximum: 500 }
end
```

```ruby
book = Book.new(last_name: nil)
book.errors
book.valid?
```

1. Describe or hypothesize the validations in the above `Book` model. For each validation rule: when is a book valid, and when is it invalid?
1. Look at the above code for `book`.
    - When is `book.errors` not empty?
    - When is `book.errors` empty?
    - When do validations run?
1. What does the `valid?` method do?
1. Construct a nominal test case to test the validation of `description` of the `Book` model. For the nominal test case to test a validation, we should create a valid book. Then we should give it an invalid description. Lastly, we should test that the book is no longer valid.
    - What is our test's Arrange step?
    - What is our test's Act step?
    - What is our test's Assert step?
1. How can we show validation errors to the user?

### Ride Share Rails

1. Everyone should quickly give a brief update describing where you and your team is in the Ride Share Rails project. Each person's update should be small and quick and 1-3 sentences, much like a stand-up meeting.
    - What is the most recent line of code you and your team wrote that you're proud of?
    - What is the current or upcoming challenge that you and your team need to tackle next?
1. What questions and help would you like to ask other groups about the project?
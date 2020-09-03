# Rails Roundtable Questions

## Basics

1. Describe the parts of the MVC pattern. 

1. What are the different parts of a route?
1. How is ERB used to generate html? What is the difference between a value tag and a code tag?
1. What new expectations are needed for a controller action tests?<!-- The above question is kinda weird???-->
1. Share your code for the baseline phase of Task List. 
    - What files did you need to update/create the complete the index action?

1. Describe the 5 HTTP verbs "popcorn" style and explain how it relates to CRUD (create, read, update and delete):
    1. `GET`
    2. `POST`
    3. `PATCH`
    4. `PUT`
    5. `DELETE`
2. Describe the methods we use to write Active Record Migrations "popcorn" style:
    1. `create_table`
    2. `add_column`
    3. `remove_column`
    4. `change_column`
    5. `rename_column`
3. Describe Rails's Seven "RESTful Routes" again "popcorn" style:
    1. `index`
    2. `new`
    3. `create`
    4. `show`
    5. `edit`
    6. `update`
    7. `destroy`

## Strong Params

1. True or False: In Rails, controllers are not allowed to directly pass form-data from params into our models.
1. True or False: In Rails, we need to use the strong params feature to give permission for which form-data from params is allowed into our models.
1. In Ada Books, `book_params` is the name of a helper method that employs our special controller methods.
    - Where do we _call_ or _invoke_ the `book_params` method? (How do we _use_ it?)
    - Could the method `book_params` be named something else?
    - `book_params` is a private method. What does a private method mean? How do we know it's a private method, and why is this a good idea?
1. Look at this following method:
    ```ruby
    def book_params
      return params.require(:book).permit(:author, :title, :description)
    end
    ```
    This method says that the `BooksController` should accept form data that looks like:
    
    ```ruby
    {
      book: {
        author: "some author",
        title: "some title",
        description: "some description"
      }
    }
    ```
    - What three attributes of a book is being allowed? What part of the syntax determines that?
    - If the Book model changed, and now had a fourth attribute `subject`, does this method `book_params` need to change? How?
    - In our `book_params` method, we are saying that we expect the form-data to be nested in a key named `book`. What part of the syntax determines that?

## Testing Database Changes in Controllers

1. When we test the `create` action in the `BooksControllers`...
    1. What change in the database can we test for?
    1. What goes in the curly braces inside the `expect ... must_differ` syntax?

1. When we test the `update` action in the `BooksControllers`...
    1. After we successfully update an existing book, what multiple changes in the database can we test for?
    1. Why do we have two tests for the `update` action?
    1. In our tests, what code can we write to reload data from our test database?

## Active Record Validations

Assume we have the following code:

```ruby
# app/models/book.rb
class Book < ApplicationRecord
  validates :title, uniqueness: true
  validates :publication_date, presence: true
  validates :description, length: { maximum: 500 }
end
```

```ruby
book = Book.new(publication_date: nil)
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

## Resources and Partial Views

1. What questions do we have on using `resources` to refactor our routes?
1. What questions do we have on using view partials?

## The Test Database

1. What is the test database, and how is it different from the development database (the database accessed when running the Rails server and visiting `localhost:3000`)?
1. What is the relationship between fixtures and the test database?
1. In Media Ranker, how will the test database be used? Use concrete and specific examples when possible.

## Flash

1. As a group, come up with a definition for `flash` in your own words
1. As a group, come up with a definition for `flash.now` in your own words. How does it differ from `flash` in syntax and use case?
1. In Media Ranker, how will `flash` be used?
1. Share code: If anyone has an example of `flash` being used in a controller action (even if it's not working or in-progress), share with the group! Practice talking through your code. Feel free to use this time to ask questions, especially if you don't have `flash` working.

## Session

1. As a group, come up with a definition for `session` in your own words, and how it helps with log-in functionality
1. As a group, come up with a description for how `session` helps with log-in functionality
1. How would our controller tests be affected by log-in functionality?
1. How does someone "clear" the contents of `session`...
    - in our Rails code?
    - in our browser?
1. Share code: If anyone has an example of `session` being used in a controller action (even if it's not working or in-progress), share with the group! Practice talking through your code. Feel free to use this time to ask questions, especially if you don't have `session` working.

1. As a group, come up with a description for how `session` helps with log-in functionality
1. How would our controller tests be affected by log-in functionality?
1. How does someone "clear" the contents of `session`...
    - in our Rails code?
    - in our browser?
1. Share code: If anyone has an example of `session` being used in a controller action (even if it's not working or in-progress), share with the group! Practice talking through your code. Feel free to use this time to ask questions, especially if you don't have `session` working.

## Heroku

1.  What purpose does Heroku serve?
1.  Who has tried to deploy a Rails application to Heroku?
    - Did you encounter any issues?
    - What actions did you have to do after `git push heroku master` and why?
    - Why does the Heroku instance have different data than localhost?

### Making an API in Rails

1. As a group, come up with a list of differences between making a full-stack web app with Rails vs. making a back-end API with Rails
1. What are the differences between testing a web app vs. testing a Rails API?

## Task List

4. Do you have any questions about Task List?  Are you stuck anywhere?  Share your code and get help!

## Ride Share Rails

1. Everyone should quickly give a brief update describing where you and your team is in the Ride Share Rails project. Each person's update should be small and quick and 1-3 sentences, much like a stand-up meeting.
    - What is the most recent line of code you and your team wrote that you're proud of?
    - What is the current or upcoming challenge that you and your team need to tackle next?
1. What questions and help would you like to ask other groups about the project?

## Media Ranker

1. As a group, share with each other what your project's models and controllers are like. What models do your projects have? What are the relationships between these models?
1. Everyone should quickly give a brief update describing where you are in the Media Ranker project. Each person's update should be small and quick and 1-3 sentences, much like a stand-up meeting.
    - What is the most recent line of code you wrote that you're proud of?
    - What is the current or upcoming challenge that you need to tackle next?
1. What questions and help would you like to ask others about the project?

## Video Store API

1. As a group, share with each other what your project's models and controllers are like. What models do your projects have? What are the relationships between these models?
1. Everyone should quickly give a brief update describing where you and your team are in the Video Store API project. Each person's update should be small and quick and 1-3 sentences, much like a stand-up meeting.
    - What is the most recent line of code you wrote that you're proud of?
    - What is the current or upcoming challenge that you need to tackle next?
1. What questions and help would you like to ask others about the project?


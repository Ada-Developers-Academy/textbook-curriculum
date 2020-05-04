# Strong Params, Branches in git

Today we are going to be discussing strong params and the development workflow using branches in git

For this discussion, think of your instructor as a mediator and guide, rather than as a lecturer. You are encouraged to do the following:

* Whenever possible, you should use voice.
* You should pose questions to the group, not the instructor.
* Similarly, you are encouraged to answer questions, with the instructor available to correct misconceptions and provide answers when no one else has an answer.
* Say something, even if you think you might be wrong! (Nobody throws a frisbee well on their first try)
* When discussing code, you are encouraged to use VS Code Liveshare, and or screen sharing through zoom.
* Take notes!

## Materials
* [Strong Params](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/08-rails/forms-strong-params.md)
* Branching in git
  * [1.2: Branches - Git and GitHub for Poets](https://www.youtube.com/watch?v=oPpnCh7InLY)
  * [Learn git Branching Lessons 1-4](https://learngitbranching.js.org/)
  * [Ada Lesson](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/00-programming-fundamentals/managing-git-branches.md)

## Prompts
You are encouraged to copy these questions into a document and take notes during the discussion.

### Strong Params

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

### Branching in git

1. Define in your own words: What is a branch in git?
1. What are some examples of when you would use a branch in git?
1. What are the commands in the terminal to run to:
    - Show a list of all of the local branches on your computer
    - Create a new local branch on your computer
    - Push commits created on a local branch to a branch on GitHub
    - Pull changes from a branch on GitHub onto your local branch
    - Switch between branches?
    - Switch to the `master` branch?
    - Merge the commits of a local branch named `sort-tasks-feature` into the branch you are currently on?
1. What would you have to keep in mind if you worked with git branches on your next project?
1. What would you and a team need to consider and communicate on if everyone worked with git branches?
1. Optional: Has anyone explored how to view git branches in VS Code? What does it look like?

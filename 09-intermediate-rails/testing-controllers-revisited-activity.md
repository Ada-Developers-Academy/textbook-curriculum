# Testing Controllers, Revisited, Activity!

## Objectives

- Review controller testing
- Apply controller testing theory to a novel situation

### Required Prior Knowledge

This lesson requires:
- Controller testing
- OAuth

## Introduction

Imagine that we are building a [micro-blogging webapp](https://en.wikipedia.org/wiki/Microblogging). Users of this webapp can log in and make blog posts.

Some features are OK for anyone, including guest users
- Viewing a list of all posts from around the world
- Viewing an individual post
- Logging in

Some features require a user to be logged in
- Creating a post
- Editing a post
  - A post may only be edited by its author
- Logging out
  
## Warm-Up

Given the following feature, let's come up with all of the situations that a user may encounter when doing or attempting to do this functionality. Then, let's come up with a list of test cases that are relevant to this feature, with a focus on edge cases.

Feature:

As a micro-blogger interested in what's happening in the world, I want to be able to go to a page that shows a list of all blog posts.

<details>

  <summary>
    Here's a list of some! Check your answer here
  </summary>
  
  1. When at least one post exists, a guest user can go to this page and successfully see it
  1. When at least one post exists, a logged-in user can go to this page and successfully see it
  1. When zero posts exist, a guest user can go to this page and successfully see it
  1. When zero posts exist, any logged-in user can go to this page and successfully see it
  
  If you have other test cases, they are definitely valid and creative, but outside of the scope of our curriculum right now. Some test cases may include "If 10 million posts exist, a user can go to this page and successfully see it," among others.
  
</details>

## Activity

1. Get into groups of four
1. For each action listed below, spend at most 8-10 minutes in groups coming up with test cases
1. Check your answers after each action
1. Check with an instructor and other groups with any questions or uncertainty

### Show a post

As a micro-blogger interested in what's happening in the world, I want to be able to go to a page that shows just one, individual, specific blog post.

<details>

  <summary>
    Here's a list of some! Check your answer here
  </summary>
  
  1. Regardless of logged-in status, if the post exists, anyone can go to this page and successfully see it
  1. Regardless of logged-in status, if the post does not exist, anyone can go to this page and get a different behavior (which behavior did your group decide?)

  If you have other test cases, they are definitely valid and creative, but outside of the scope of our curriculum right now.
  
</details>


### Log in

As a human interested in this micro-blogging webapp, I want to be able to log in.

<details>

  <summary>
    Here's a list of some! Check your answer here
  </summary>
  
  1. The human is a new user, and creates an account with valid data
  1. The human is a new user, and creates an account with invalid data
  1. The human is an existing user, and logs in with valid data
  1. The human is maybe an existing user, but logs in with invalid data
  1. The user is already logged-in
  
  What are the expected results that your group came up with for each test case? What should the webapp do in these different scenarios?

  If you have other test cases, they are definitely valid and creative, but outside of the scope of our curriculum right now.
  
</details>

### Edit a blog post

As a blogger, I want to be able to edit a specific blog post.

<details>

  <summary>
    Here's a list of some! Check your answer here
  </summary>
  
  1. Regardless of logged-in status, the blog post does not exist
  1. The user is not logged in
  1. The logged-in user is not the author of this blog post
  1. The logged-in user is the author, but the edited blog post is invalid (maybe over the word count, missing a title, etc)
  1. The logged-in user is the author, and the edited blog post is valid
  
  What are the expected results that your group came up with for each test case? What should the webapp do in these different scenarios?

  If you have other test cases, they are definitely valid and creative, but outside of the scope of our curriculum right now.
  
</details>

### Delete a user

As a human on the Internet, I want to be able to delete a user from this micro-blogging webapp.

<details>

  <summary>
    This is a weird one, that has conversation that goes beyond test-cases, and more about "what does this mean in the context of a Rails app." Talk about what this feature means as a team and record your questions about how to implement this and test it. Then, click here to see what things we definitely considered and questioned.
  </summary>
  
  - What does this route look like?
      - Delete user by ID, or delete currently logged in user?
      - Should the user be logged out? How would you test this?
  - Is it possible to get into a situation where you try to delete a user that does not exist? In tests? In regular operation?
  - Test case to have: user has no posts
  - Test case to have: user does have posts (does this work? what happens to the posts?)
  
  What are the expected results that your group came up with for each test case? What should the webapp do in these different scenarios?

  If you have other test cases, they are definitely valid and creative, but outside of the scope of our curriculum right now.
  
</details>

## Conclusion

Coming up with tests for controllers tends to be formulaic, but its edge cases rely a lot on context of the webapp. Controller tests also deal a lot with authentication and authorization.

When in doubt, [begin your controller tests by referring to our resource on our Mega Controller Test Summary](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/09-intermediate-rails/testing-controllers-revisited.md)

# Making Post Requests

In our past exercises we _consumed_ information from an API.  We looked up details about particular resources and used them in our Ruby applications.  However we do not have the ability to _create_ any information on the external API.  In this lesson we will introduce the concept of a `POST` request which can save information to the API.  We will do so using the [Twitter API](https://developer.twitter.com/en/docs/basics/getting-started) to create our own command-line twitter-bot.

## Learning Goals

By the end of this lesson you should be able to:

- Identify the differences between a `GET` and `POST` request.
- Use Postman and HTTParty to make a `POST` request to save data to an api.
- Write tests to verify the results of a `POST` request using the VCR gem.

## Overview of Post Requests


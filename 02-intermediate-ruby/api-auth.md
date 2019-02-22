# APIs and Authorization

## Learning Goals

By the end of this lesson, students should be able to...

- Use an API that requires an authentication token
- Store API credentials securely

## Authentication

While some APIs are open for anyone to use, many require you to have an account and to identify yourself when you send a request.

Requiring users to have an account has many benefits for API maintainers:

- Improved data about users
- Ability to rate-limit or "throttle" requests
- Ability to charge users for certain features

_Authentication_ is a branch of computer security that deals with the questions "who are you and how can I trust you".

Authentication is distinct from _authorization_, which answers the question "what am I allowed to do?". Both start with "auth", which can be a little confusing. Here's a way to remember which is which:
- **Authentication:** is this request _authentic_, did it really come from you?
- **Authorization:** are you _authorized_ to do that action?

For now we will focus solely on authentication, though we will return to the topic of security in the coming weeks.

### Authentication Tokens

There are several ways an API might require a client to identify itself, but the most common is by using an _authentication token_.

An authentication token is a secret known by both the API and the client application, but not by anyone else. It's kind of like a password for your app.

In practice the token is a long string of characters that it would be very difficult to guess if you didn't know it already. It's definitely the sort of thing you will want to copy/paste. Usually the API will give you access to the secret via the browser when you set up your account, and you can copy it into your app's configuration.

### Example: The Movie DB

[The Movie DB](https://www.themoviedb.org/) is an online resource for all things cinema. It's similar to IMDB, except IMDB is just a website, while The Movie DB has an API. That makes TMDB much more useful to us as programmers.

Enter the following URL into your browser:

```
https://api.themoviedb.org/3/search/movie?query=hidden%20figures
```

**Question:** Did it work? What is the API telling you?

The Movie DB requires an authentication token (what they call an "API key") before it will respond to requests. So let's go get one!

1. [Create an account](https://www.themoviedb.org/account/signup)
1. Find your API keys:
    - Click on the picture of you in the upper right-hand corner
    - In the drop-down menu, click `Settings`
    - On the left, click `API`
    - Your key is under `API Key (v3 auth)`. Copy it to your clipboard now.

Now we can update the URL we used before with an extra `api_key` query parameter:

```
https://api.themoviedb.org/3/search/movie?query=hidden%20figures&api_key=<paste here>
```

By the way, all of this is covered in [The Movie DB's documentation](https://developers.themoviedb.org/3). The documentation is where you would go to figure all this out for a new API.

## Storing Credentials Securely

This authorization token uniquely identifies and provides access to your account. Just like a password, anyone who has the token can pretend to be you. This means you need to be careful about keeping track of your tokens.

## Summary

## Additional Resources
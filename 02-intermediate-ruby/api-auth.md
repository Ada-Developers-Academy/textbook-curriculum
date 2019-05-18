# APIs and Authorization

## Learning Goals

By the end of this lesson, students should be able to...

- Use an API that requires an _authentication token_
- Store _API credentials_ securely
- Recognize and use _environment variables_ in Ruby with the `dotenv` gem

## Authentication

While some APIs are open for anyone to use, many require you to have an account and to identify yourself when you send a request.

Requiring users to have an account has many benefits for API maintainers:

- Improved data about users
- Ability to rate-limit or "throttle" requests
- Ability to charge users for certain features

_Authentication_ is a branch of computer security that deals with the questions "who are you and how can I trust you".

Authentication is distinct from _authorization_. Authorization answers the question "what am I allowed to do?". Both start with "auth", which can be a little confusing. Here's a way to remember which is which:

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

### Resetting Keys

Every once in a while you will find that your keys have been compromised and are no longer secret. Maybe you uploaded them to Git accidentally, they were in the background of a screenshot, or maybe you had them in your clipboard and accidentally pasted them into Slack. Now what?

Fortunately most APIs make it easy to _reset_ your API keys. This will invalidate the old key and generate a new one for you to use. This is true of most of the APIs we'll be using in this class, including Slack and GitHub, but not TMDB.

## Storing Credentials Securely

This authorization token uniquely identifies and provides access to your account. Just like a password, anyone who has the token can pretend to be you. This means you need to be careful about keeping track of your tokens.

In particular, you cannot commit tokens to git, because everything in a git repository is visible publicly on the internet. Instead we will make these tokens part of our application's _environment_.

### Environment Variables

Every program you run has access to a special set of information known as its environment. Some of this information is provided by the operating system, some by the Ruby interpreter, and some comes from the application itself. In Ruby, we can access this information through a built-in hash constant called `ENV`. Fire up `pry` and take a look at this constant:

```ruby
$ pry
[1] pry(main)> ENV.keys
=> ["TERM_SESSION_ID",
 "SSH_AUTH_SOCK",
 "Apple_PubSub_Socket_Render",
 "COLORFGBG",
 "ITERM_PROFILE",
 ...
[2] pry(main)> ENV['USER']
=> "droberts"
[3] pry(main)> ENV['HOME']
=> "/Users/droberts"
[4] pry(main)> ENV['RUBY_VERSION']
=> "ruby-2.5.5"
```

Things to notice:
- `ENV` is just a regular old Ruby hash, and can be read and modified as such. However, it is generally considered good practice not to change `ENV` directly.
- The keys in `ENV` are strings, not symbols.
- By the convention, most of the keys in `ENV` are upper case (think constants).

### The `dotenv` Gem

We can get our program to load some extra information at startup using a gem called `dotenv`. Install it now:

```
$ gem install dotenv
```

The `dotenv` gem looks for a file called `.env` in the project root. If it finds one, it will read the contents as key-value pairs and add them to the `ENV` hash.

**Question:** What does the `.` at the start of the filename `.env` mean?

We can write a small Ruby program (or use `pry`) to test this out. To simulate a real project, we'll create a full directory structure.

```bash
$ mkdir dotenv_practice
$ cd dotenv_practice
$ touch .env
$ touch dotenv_practice.rb
```

Then fill in the two files:

```
# .env
LUNCH=tofu scramble
```

```ruby
# dotenv_practice.rb
require 'dotenv'

# Tell dotenv to look for the .env file
Dotenv.load

puts ENV['LUNCH']
# => tofu scramble
```

### Ignoring `.env`

Our plan is to use the `.env` file to store our secret authentication token, which means we must not check the `.env` file into git. To do so, create a `.gitignore` file and add `.env` to it:

```
# .gitignore
.env
```

Then add and commit the `.gitignore`:

```
$ git add .gitignore
$ git commit -m "Ignore the .env file"
```

**NEVER COMMIT A `.env` TO GIT!**

Since the `.env` file is not in git, if you are working with a partner each of you will need to create and populate a `.env` file.

## Exercise

Now it's time to put all these pieces together. Add your MovieDB token from above to the `.env` file on a new line, and modify your Ruby script to use the token to make a search against the API.

Debugging will be key here! How will you know whether your program has successfully queried the API? What will you do if it didn't work?

<details>
<summary>Click to see our implementation.</summary>

```ruby
# dotenv_practice.rb
require 'dotenv'
require 'httparty'

Dotenv.load

unless ENV['MOVIEDB_API_KEY']
  puts "Could not load API key, please store in the environment variable 'MOVIEDB_API_KEY'"
  exit
end

URL = "https://api.themoviedb.org/3/search/movie"

while true
  puts "Welcome to the movie lookup! Please enter a movie title. 'quit' to stop."
  search = gets.chomp

  break if search.downcase == 'quit'

  response = HTTParty.get(URL, query: {
    query: search,
    api_key: ENV['MOVIEDB_API_KEY']
  })

  if response['success'] == false
    puts "Something went wrong: #{response['status_message']}"
  elsif response['results'].any?
    puts "Here is a summary of that movie:"
    puts response['results'].first['overview']
  else
    puts "We couldn't find that movie :("
  end
end

puts "OK bye"
```
</details>

## Summary

To use an API that requires credentials from Ruby:
1. Get an authentication token from the API, typically via their website
1. Store the token in a `.env` file
    - Each line has form `KEY=VALUE`
    - Do not commit this to git!
1. Use the `dotenv` gem to load environment data
    - Remember to call `Dotenv.load`
    - Data will be available in the `ENV` hash
1. Make an `HTTParty` request using the token

## Additional Resources

- [`dotenv` gem documentation](https://github.com/bkeepers/dotenv)
- [Ruby `ENV` documentation](https://ruby-doc.org/core/ENV.html)

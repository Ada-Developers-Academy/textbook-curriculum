# Consuming an API from a Rails app

## Learning Goals

- Interact with an API that requires authentication
- Build an API wrapper in the context of a Rails app
- Use data from an API in a Rails site

## Initial Setup
**TODO: link**

[Download the initial project setup]()

What's here?
- Standard Rails app setup
- No Models!
- One controller
- Views and such are already set up
- An extra file: `lib/api_wrapper.rb`

## The Slack API
Today, we'll be experimenting with Slack's API. This API is the same one used by the Slack app, and lets you (among other things) post and read messages. People have used it to write all sorts of interesting plugins, from things like sending a message in a certain channel when a test run is finished, to commenting with details when someone mentions a bug number.

[You can read about the details of Slack's API here.](https://api.slack.com/)

### Sending a Message
Open up Postman, and send a `POST` request to `https://slack.com/api/chat.postMessage`, with these params:

| Key       | Value                                    |
|:----------|:-----------------------------------------|
| `channel` | `test-api-brackets` or `test-api-parens` |
| `text`    | `Some test text`                         |

The idea is for this to post a message in the `test-api-xxx` channel, but it didn't work! Insetad, no message was posted, and you should have gotten back a response from Slack:

```json
{
  "ok": false,
  "error": "not_authed"
}
```

### Authentication
Slack won't let just anyone post to a team's board. Before it will send your messages through, you must prove that you've got permission to post there. In order to do this, we'll set up an API token.

The token we're about to create is a secret! Keep it safe, just like you would a password or your GitHub OAuth credentials. Don't ever check it in to GitHub, or post it in a public place. We'll be using the same `dot-env` technique to keep it safe as we did for GitHub OAuth.

To generate a token, navigate to https://api.slack.com/docs/oauth-test-tokens, find the entry for the `adacohort6` channel, and click `Create token`.

To use the token, add it to the params in your Postman request:

| Key       | Value                                    |
|:----------|:-----------------------------------------|
| `token`   | `xoxp-XXXXXXXX-YYYYYYYY-ZZZZZZZZ`        |
| `channel` | `test-api-brackets` or `test-api-parens` |
| `text`    | `Some test text`                         |

Poof! Message sent! Check it out on Slack! Also take a look at the response the Slack API sent back.

Today we'll only be using two of the Slack API calls
```
GET  https://slack.com/api/channels.list
POST https://slack.com/api/chat.postMessage
```
but there are many more. The whole list is at https://api.slack.com/methods

## Using the API from Rails
Take a moment to browse through the starter Rails app. Notice that there's no model! This is because we're not storing any data locally, we're going to send it all straight to Slack.

The idea for our app is simple: it should display a list of all public channels for the Slack team. When a channel is selected, the user should be directed to a form where they can write a message to send to that channel.

### Adding the Token
Let's start by adding our token to the `.env` file. Remembering back to our lecture on GitHub OAuth, the steps are:

1. Add `dotenv-rails` to the `:development` group in the Gemfile (this has already been done).
1. Add `.env` to your `.gitignore` file
1. `$ touch .env`
1. In the `.env`, add the line `SLACK_TOKEN = xoxp-XXXXXXXX-YYYYYYYY-ZZZZZZZZ`

To verify, fire up the rails console and run `ENV["SLACK_TOKEN"]`. It should output the token.

### Wrapping the Slack API
Rails doesn't have any magic around consuming APIs like it does for models or views, so we'll have to do everything ourselves.

#### Setup
We will put the wrapper for our Slack API under the `lib` folder:
```
$ touch lib/slack_wrapper.rb
```

And in that file (to start)

```ruby
# lib/slack_wrapper.rb
require `httparty`

class SlackWrapper
end
```

Ruby doesn't yet know about our custom library, so we need to tell it where to look. In fact, let's tell it to automatically load any ruby files we put under `/lib`. Open up `config/application.rb` and add the following code to the end of class `Application`:

```ruby
module SlackMkii
  class Application < Rails::Application
    # ...
    # Keep any code that was here before
    # ...

    # Automatically load all code from <rails_root>/lib
    config.autoload_paths << Rails.root.join('lib')
  end
end
```

And that should do it. To verify it worked, spin up the rails console, and run `SlackWrapper.new`. It should return a new instance of SlackWrapper, instead of throwing an error.

You'll have to restart the rails server in order for it to load the new library.

#### Building the Wrapper
Our wrapper will have two methods. `channels` will return a list of all the channel names for our Slack team. `send_message(channel, message)` will send the given message to the given channel.

To start, let's set up some useful constants:

```ruby
# lib/slack_wrapper.rb
require 'httparty'

class SlackWrapper
  BASE_URL = "https://slack.com/api/"
  TOKEN = ENV["SLACK_TOKEN"]
end
```

The `BASE_URL` is the beginning of every request, and the `TOKEN` will be the Slack API token we made available through the .env file earlier.

Next, we'll add an implementation of `channels`. This will send a `GET` request to the corresponding API end point, returning the results as an array. Note that we also pass the `exclude_archived` parameter, because we don't want to be able to send to archived channels.

```ruby
def self.channels()
  url = BASE_URL + "channels.list?" + "token=#{TOKEN}" + "&exclude_archived=1"
  data = HTTParty.get(url)
  if data["channels"]
    return data["channels"]
  else
    return []
  end
end
```

And finally, `send_message`:

```ruby
def self.send_message(channel, msg)
  url = BASE_URL + "chat.postMessage?" + "token=#{TOKEN}" + "&text=#{msg}&channel=#{channel}"
  data = HTTParty.post(url)
end
```

Verify it works through the rails console: `SlackWrapper.send_message("@<username>", "test test test")`

### The Channels Controller
**TODO: Modify based on our actual implementation**

The last step is to call our new API wrapper, so that we can build a nice website around it. Since you're all already experts in Rails, we've gone ahead and built most of the views for you - the only thing left is to tie it into the controller.

First, for `index`, make the full list of channels available to the view via the `@channels` instance variable.

Second, for `send_message`, actually send the message using the `channel` and `message` variables.

And voila! A neat little Rails app that talks to Slack.

## What Have We Accomplished?

- Experimented with the Slack API using Postman
- Set ourselves up with an authentication token
- Stored that token securely in a Rails app
- Wrote a wrapper for the Slack API as a Rails library
- Used that wrapper library in the rest of our app

## Additional Resources
- [Slack API documentation](https://api.slack.com/)
- [The Odin Project on working with external APIs](http://www.theodinproject.com/courses/ruby-on-rails/lessons/working-with-external-apis)

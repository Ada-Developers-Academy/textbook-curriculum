# Consuming an API from a Rails app

## Learning Goals

- Interact with an API that requires authentication
- Build an API wrapper in the context of a Rails app
- Use data from an API in a Rails site

## Overall Approach
<!-- Diagram located here https://drive.google.com/a/adadevelopersacademy.org/file/d/0B6Pq6XZ1hzv1WXhPVGpUUmhES2M/view?usp=sharing -->
![API Diagram](images/rails-authenticated-API.png)

## Initial Setup
In the calendar, you'll find a link to a github repo. Go ahead and clone that repo!

What's here?
- Rails app setup
- No Models!
- One controller
- View files matching the controller
- A few routes
- An extra file: `lib/api_wrapper.rb`

## The Slack API
Today, we'll be experimenting with Slack's API. This API is the same one used by the Slack app, and lets you (among other things) post and read messages. People have used it to write all sorts of interesting plugins, from things like sending a message in a certain channel when a test run is finished, to commenting with details when someone mentions a bug number.

[You can read about the details of Slack's API here.](https://api.slack.com/)

### Sending a Message
Open up Postman, and send a `POST` request to `https://slack.com/api/chat.postMessage`, with these params under `x-www-form-urlencoded`:

| Key       | Value                                    |
|:----------|:-----------------------------------------|
| `channel` | `test-api-channel` |
| `text`    | `Some test text`                         |

The idea is for this to post a message in the `test-api-channel` channel, but it didn't work! Instead, no message was posted, and you should have gotten back a response from Slack:

```json
{
  "ok": false,
  "error": "not_authed"
}
```

### Authentication
Slack won't let just anyone post to a team's board. Before it will send your messages through, you must prove that you've got permission to post there. In order to do this, we'll set up an API token.

The token we're about to create is a secret! Keep it safe, just like you would a password or your GitHub OAuth credentials. Don't ever check it in to GitHub, or post it in a public place. We'll be using the same `dot-env` technique to keep it safe as we did for GitHub OAuth.

To generate a token, navigate to https://api.slack.com/docs/oauth-test-tokens, find the entry for your cohort's channel, and click `Create token`.

![Slack API Token](images/slack-api-token.png)  

To use the token, add it to the params in your Postman request:

| Key       | Value                                    |
|:----------|:-----------------------------------------|
| `token`   | `xoxp-XXXXXXXX-YYYYYYYY-ZZZZZZZZ`        |
| `channel` | `test-api-channel` |
| `text`    | `Some test text`                         |

Poof! Message sent! Check it out on Slack! Also take a look at the response the Slack API sent back in Postman.

Today we'll only be using two of the Slack API calls
```
GET  https://slack.com/api/channels.list
POST https://slack.com/api/chat.postMessage
```
but there are many more. The whole list is at https://api.slack.com/methods

## Using the API from Rails
Take a moment to browse through the starter Rails app. Notice that there's no model! This is because we're not storing any data locally, we're going to pull it from and send it to Slack.

The idea for our app is simple: it should display a list of all public channels for the Slack team. When a channel is selected, the user should be directed to a form where they can write a message to send to that channel.

### Adding the Token
Let's start by adding our token to the `.env` file. Remembering back to our lecture on GitHub OAuth, the steps are:

1. Add `dotenv-rails` to the `:development, :test` group in the Gemfile (this has already been done).
1. Add `.env` to your `.gitignore` file
1. `$ touch .env`
1. In the `.env`, add the line `SLACK_TOKEN = xoxp-XXXXXXXX-YYYYYYYY-ZZZZZZZZ`

To verify, fire up the rails console and run `ENV["SLACK_TOKEN"]`. It should output the token.

### Wrapping the Slack API
Rails doesn't have any magic around consuming APIs like it does for models or views, so we'll have to do everything ourselves. We have already created the stub file with the started class code for you. Take a look in `lib/slack_api_wrapper.rb`.

Rails normally doesn't know about custom libraries we put in the `lib` folder. We need to modify the application configuration to look for these files. **This has already been done for you**, but in your projects you'll have to do this yourself. Look in `config/application.rb`:

```ruby
module SlackAPI
  class Application < Rails::Application
    # ...
    # Code that was there before
    # ...

    # Automatically load all code from <rails_root>/lib
    config.autoload_paths << Rails.root.join('lib')
  end
end
```

To verify it worked, spin up the `rails console`, and run `SlackApiWrapper.new`. It should return a new instance of SlackApiWrapper, instead of throwing an error.

You'll have to restart the rails server in order for it to load the new library.  **Note:  Each time you make a change to code in the /lib folder, you will need to restart the rails server.**

#### Building the API Wrapper
Our wrapper will have two methods. `list_channels` will return a list of all the channel names for our Slack team. `send_msg(channel, message)` will send the given message to the given channel.

To start, let's set up some useful constants:

```ruby
# lib/slack_api_wrapper.rb
require 'httparty'

class SlackApiWrapper
  BASE_URL = "https://slack.com/api/"
  TOKEN = ENV["SLACK_TOKEN"]
end
```

The `BASE_URL` is the beginning of every request, and the `TOKEN` will be the Slack API token we made available through the .env file earlier.

Next, we'll add an implementation of `list_channels`. This will send a `GET` request to the corresponding API end point, returning the results as an array. Note that we also pass the `exclude_archived` parameter, because we don't want to be able to send to archived channels.

```ruby
def self.list_channels
  url = BASE_URL + "channels.list?" + "token=#{TOKEN}" + "&exclude_archived=1"
  data = HTTParty.get(url)
  if data["channels"]
    return data["channels"]
  else
    return []
  end
end
```

And finally, `send_msg`:

```ruby
def self.send_msg(channel, msg)
  puts "Sending message to channel #{channel}: #{msg}"

  url = BASE_URL + "chat.postMessage?" + "token=#{TOKEN}"
  response = HTTParty.post(url,
  body:  {
    "text" => "#{msg}",
    "channel" => "#{channel}",
    "username" => "Roberts-Robit",
    "icon_emoji" => ":robot_face:",
    "as_user" => "false"
  },
  :headers => { 'Content-Type' => 'application/x-www-form-urlencoded' })
  return response.success?
end
```

Verify it works through the rails console: `SlackApiWrapper.send_msg("test-api-channel", "test test test")`

### The Controller

The last step is to call our new API wrapper, so that we can build a nice website around it. Since you're all already experts in Rails, we've gone ahead and built most of the views for you - the only thing left is to tie it into the controller.

This will all take place in `app/controllers/chat_controller.rb`

#### Exercise
Work with your seat squad to complete the controller actions to tie together the API wrapper code we've written with your existing knowledge of the Rails request cycle.

1. First, we want to set up the controller to show the list of channels from the API.

2. Next, we want to be able to use our Rails app to send a new message via our browser. We will utilize the routes for `new` and `create` to complete this action. Be sure to look at how the routes are set up before you dive in!

First, get the `new` form to render. Second, get the form post to work with sending a message to Slack!


### Cleaning Up: The Channel Object
Right now, we return Ruby Hash objects that are structured based on the data passed back from the API. This has a few drawbacks:

- The Rails code using our API responses will need to know how the API formatted the data
- If the API changes, the way we use the formatted data will change

This defeats the whole point of wrapping the API! Instead, let's build a `Channel` object to make life a little easier for someone (like us in 20 minutes). Note that the started file has been created for you in `lib/channel.rb`.

A `Channel` should have a publicly visible name, as well as other fields we get back from the API.

**QUESTION:** should name be an `attr_reader`, `attr_writer`, or `attr_accessor`? Why?

Here's one possible implementation of `Channel`:

```ruby
# lib/channel.rb
class Channel
  attr_reader :name, :id, :purpose, :is_archived, :members

  def initialize(name, id, options = {} )
    raise ArgumentError if name == nil || name == "" || id == nil || id == ""

    @name = name
    @id = id

    @purpose = options[:purpose]
    @is_archived = options[:is_archived]
    @is_general = options[:is_archived]
    @members = options[:members]
  end
end
```

And modifications to our API wrapper:

```ruby
# lib/slack_api_wrapper.rb
def self.list_channels
  url = BASE_URL + "channels.list?" + "token=#{TOKEN}" + "&pretty=1&exclude_archived=1"
  data = HTTParty.get(url)
  channel_list = []
  if data["channels"]
    data["channels"].each do |channel_data|
      channel_list << create_channel(channel_data)
    end
  end
  return channel_list
end

private

def self.create_channel(api_params)
    return Channel.new(
      api_params["name"],
      api_params["id"],
      {
        purpose: api_params["purpose"],
        is_archived: api_params["is_archived"],
        members: api_params["members"]
      }
    )
  end
```

Now, all of the logic that relies on the specific Slack API channel data is encapsulated into a single method `create_channel`. If the data in the API response changes, this will be the only method we need to update.

When you reload the root route now, what do you notice? Is there anything else we need to update? (Spoiler alert: YES!)

Once you update the index view, you should now see that the list of channels is the same as what we saw before! Though we don't see anything different, we can sleep well knowing that we've reduced dependencies in the underlying code. GREAT JOB!

## What Have We Accomplished?

- Experimented with the Slack API using Postman
- Set up an authentication token
- Stored that token securely in a Rails app
- Wrote a wrapper for the Slack API as a Rails library
- Used that wrapper library in the rest of our app

## Refactoring

There are a number of features we could add including:
-  Posting as a specific user
-  Changing the icon of the poster
-  Posting files or other content
-  Instead of using the test token we could use [oauth](https://api.slack.com/docs/oauth) to authenticate.

We could also create a slack message class, similar to our `Channel` to further separate the implementation details from our controller.  

## Additional Resources
- [Slack API documentation](https://api.slack.com/)
- [The Odin Project on working with external APIs](http://www.theodinproject.com/courses/ruby-on-rails/lessons/working-with-external-apis)

# Using Backbone With an API

## Learning Goals
- Use Backbone to retrieve and render data from an API
- Send Backbone data to an API
- Write custom parsers and formatters to match API data and Backbone Models

## Introduction: tasklist and the Task API
For this live-code, we'll be using the same Backbone task list we've used so far for live code. If you've been following along you should be able to use your version, but just in case the `api-baseline` branch of the [live code repository](https://github.com/Ada-C6/backbone-live-code/tree/api-baseline) is a good starting point.

Our task list has a lot of features so far, but it's also got one major problem: tasks are not persistent. Every time we reload the page, we get the same old static data, without any of our changes.

In order to add persistence, we'll need to make our app talk to an external API. The [Ada TaskList API](https://ada-tasklist-api.herokuapp.com/tasks), [documented here](https://github.com/droberts-ada/ada-tasklist-api), ought to do nicely.

**Question:** How do you make your app talk to an API? Which Backbone components ought to be responsible for this behavior?

**Question:** How is this similar to what we've done in Rails?

![Backbone JS Architecture from http://www.slideshare.net/ronreiter/writing-html5-web-apps-using-backbonejs-and-gae](images/backbonejs-architecture.jpg)

### Reading Data From an API

### Writing Data To an API

### Custom Parsers and Formatters

## What Did We Accomplish?

## Additional Resources

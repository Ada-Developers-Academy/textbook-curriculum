# Using Backbone With an API

## Learning Goals
- Use Backbone to retrieve and render data from an API
- Send Backbone data to an API
- Write custom parsers and formatters to match API data and Backbone Models

## TaskList and the Task API
### Introduction
For this live-code, we'll be using the same Backbone task list we've used so far for live code. If you've been following along you should be able to use your version, but just in case the `api-baseline` branch of the [live code repository](https://github.com/Ada-C6/backbone-live-code/tree/api-baseline) is a good starting point.

Our task list has a lot of features so far, but it's also got one major problem: tasks are not persistent. Every time we reload the page, we get the same old static data, without any of our changes.

In order to add persistence, we'll need to make our app talk to an external API. The [Ada TaskList API](https://github.com/droberts-ada/ada-tasklist-api) ought to do nicely. Follow the instructions in the README to run the server locally, and take a few minutes to familiarize yourself with the API.

Note that these instructions will work just as well for a deployed API - just change the URL.

**Question:** How might you make your app talk to an API? Which Backbone components ought to be responsible for this behavior?

**Question:** How is this similar to what we've done in Rails?

![Backbone JS Architecture from http://www.slideshare.net/ronreiter/writing-html5-web-apps-using-backbonejs-and-gae](images/backbonejs-architecture.jpg)

### Reading Data From an API
#### Removing Static Data
If we're going to read our data from an API, that means we don't need to keep any static data in our JavaScript files. Go into `src/app.js` and delete `taskData`.

Since we're not getting data locally, we need to tell Backbone to read it from the remote server. To do so, add a call to `taskList.fetch()` once you've initialized the Collection.

When you're done, `app.js` should look like this:

```javascript
import $ from 'jquery';

import TaskList from 'app/collections/task_list';
import TaskListView from 'app/views/task_list_view';

$(document).ready(function() {
  var taskList = new TaskList();
  taskList.fetch();

  var options = {
    el: $('#application'),
    model: taskList
  };
  var application = new TaskListView(options);
  application.render();
});
```

#### Configuring Backbone for Our API
Backbone doesn't just magically know where our API is or how it works - we have to tell it. Open up `src/app/collections/task_list.js`.

First we need to tell Backbone the URL of our API:

```javascript
var TaskList = Backbone.Collection.extend({
  model: Task,
  url: 'http://ada-tasklist-api.herokuapp.com/tasks'
});
```

Second we need to tell Backbone how to interpret the data it gets back. We can do so by implementing the `parse()` function, which Backbone calls on the data it gets back from the API. `parse()` should return an array of JavaScript objects representing tasks, the same data format our static data was in before.

**Question:** What does the data we get back from the API look like? How can we turn it into what we want?

```javascript
var TaskList = Backbone.Collection.extend({
  model: Task,
  url: 'http://ada-tasklist-api.herokuapp.com/tasks',
  parse: function(data) {
    return data.tasks;
  }
});
```

Note that you only need a `parse()` function if the data sent by your API doesn't match what Backbone expects (an array of objects). If that is the format, you can omit `parse()`.

### Writing Data To an API

### Custom Parsers and Formatters

## What Did We Accomplish?

## Additional Resources
- [Backbone docs on API integration](http://backbonejs.org/#API-integration)
- [Building a public API in Rails](http://davidsulc.com/blog/2011/04/10/implementing-a-public-api-in-rails-3/comment-page-1/)
- [Consuming a public API in jQuery](http://davidsulc.com/blog/2011/04/17/consuming-a-public-rails-api-with-jquery/)

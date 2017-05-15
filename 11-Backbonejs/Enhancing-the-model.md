
# Enhancing the Model

### Revisiting The Task Model

We can edit the Task model by adding a hash of attributes to initialize.  For example below we can set default values for attributes:

```javascript
// src/app/models/task.js
import Backbone from 'backbone';

var Task = Backbone.Model.extend({
  defaults: {
    title: '',
    completed: false
  }
});

export default Task;
```

Then any tasks created like `var my_other_task = new Task({title: "Study JavaScript" });` will automatically have a field named `completed` set to false.  This is also how you can add custom methods (including business logic) to your model. For example we've done a lot of printing the title & completion status of our Task to the console, a logStatus method might be handy. 

```javascript
// src/app/models/task.js
import Backbone from 'backbone';

var Task = Backbone.Model.extend({
  defaults: {
    title: '',
    completed: false
  },
  logStatus: function() {
    console.log("Title: " + this.get("title"));
    console.log("Completed: " + this.get("completed"));
  }
});

export default Task;
```

Then in our `app.js` we can simply print out the status of our task with:  `my_task.logStatus();`

#### Check-in Point

Add a `toggleComplete` method which marks a complete task to incomplete or an incomplete task to complete.  We'll try to use it later.

If you're stuck you can see a working solution [here:](https://gist.github.com/CheezItMan/38fac3dfd1f26cdd19a32b50b2a5c359)

### A List of Models

Now that we have a model & a template we can output a list of tasks to the browser.  

```JavaScript
// src/app.js
import $ from 'jquery';
import _ from 'underscore';
import Task from 'app/models/task.js';

var taskData = [
  {
    title: 'Mow the lawn',
    description: 'Must be finished before BBQ on Sat afternoon'
  }, {
    title: 'Go to the Bank',
    description: 'Need to make a transfer'
  }, {
    title: 'Tune the Piano',
    description: 'High C is missing or something???'
  }
];
var tasks = [];

$(document).ready(function() {
  _.each(taskData, function(taskObj) {
    var task = new Task(taskObj);
    tasks.push(task);
    var template_text = $('#taskItemTemplate').html();
      // Get an underscore template object
    var template = _.template(template_text);
      //
    $('main').append(template(task.toJSON()));
  });
  $('#test-area').append($('<p>Hello World!</p>'));
});
```

Now using an Array, we can display any number of Tasks using the Underscore template on the screen.  


## Resources
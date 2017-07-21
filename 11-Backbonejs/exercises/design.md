# Backbone Design
For this assignment you will review an existing website and plan out the design of a Backbone application that would implement that website's functionality.

## Instructions
### Review a website
You can choose to review either [Trello](https://trello.com) or [Stack Overflow](https://stackoverflow.com). Because both of these websites are large and have several different UIs based on what exactly you're doing with the site. For this exercise you will review only one page from either site:
* For Trello please review the [board details page](https://trello.com/b/nC8QJJoZ/trello-development-roadmap).
* For Stack Overflow please review the [question details page](http://stackoverflow.com/questions/20561577/what-is-difference-between-and-this-in-backbone).

You do not have to use the exact instances of those pages that are linked above -- any Trello board, or any Stack Overflow question is fine.

### What to look for
When reviewing the website you should pay attention to the following elements that indicate how the page was designed:
* **Structure**
  * What parts of the page are nested within other parts?
  * What parts of the page are placed before or after other parts?
  * What parts of the page form the main content?
  * Are there sidebars and/or menus?
* **Components**
  * What parts of the page bring together multiple, related data values into a single "unit"?
  * What parts of the page repeat and have the same appearance and/or structure but different data?
* **Interactivity**
  * What parts of the page can you interact with via keyboard or mouse?
  * When you interact with them what other parts of the page change?

The answers to each of these questions should help inform your design of a Backbone application that the site could use. Some aspects of the page design map to Backbone Views, while others map to Models, Collections, and events.

### Design a Backbone application
Once you've completed your review of the page, take some time to consider what Backbone Views, Models, and Collections you would need to create in order to build that page. You should write up an outline document with the following information:
* Views
  * List each View and what part(s) of the page it controls
  * Explain the Views' hierarchial structure by showing which Views are nested in which other Views
* Models
  * List each Model and what data attributes it has
  * List which View(s) are associated with which Models
* Collections
  * List each Collection and what Model it uses
  * List which View(s) are associated with which Collections
* Events
  * List the DOM events that are handled by each View
  * List any custom events that view might trigger

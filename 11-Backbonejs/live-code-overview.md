# Backbone Live Code: BackBooks

## Learning Objectives

By the end of this lecture, you should be able to:

- Download and run the scaffold for this week's live code
- Navigate through the directory structure to find important files
- Describe how project code is organized

## Introduction

As we learn about Backbone, we'll be using a running example: an application to keep track of a library of books, similar to the one we built at the beginning of Rails. The difference is, this library will be a Single Page Application. You can find the initial setup linked in the calendar. The initial setup lives on the branch `master`, and the final result that we're working toward lives on the branch `endgame`.

TODO DPR
You can see the finished version here: [https://cheezitman.github.io/tasklist-js/](https://cheezitman.github.io/tasklist-js//)

### Running the Code

The live code setup is a little more complex than what we've done in the past with JavaScript. Instead of directing your browser straight to a file, we'll run a simple webserver, kind of like what we did with Rails. To get started, run the following in the command line:

```bash
$ git clone https://github.com/AdaGold/backbooks-client.git
$ cd backbooks
$ npm install
$ npm start
```

`npm start` runs the webserver - that's what all those scrolling statements are. If you navigate to http://localhost:8080, you should see the words `Welcome to the Backbone Book List` in the familiar Foundation font on a white background, along with a form and an empty table.

### Modules

The webserver is called **webpack**, and it is what's known as a "bundler". Much like the Rails server, its job is to keep track of all the JavaScript files we write and libraries we use, and pull them all together into one application. It can even do clever tricks like detecting when the code has changed and automatically refreshing your browser window.

In addition to webpack, we've included a module called **babel**. Babel is called a transpiler, and it helps deal with the fact that some users are running old versions of browsers that don't yet support ES6. Babel takes our ES6 code and _transpiles_ (translates and compiles) it into older versions of JavaScript. Because we've tied it into webpack, this happens automatically - you should be able to write ES6 code and have it work in any browser, new or old.

In addition to those two several other libraries have been pre-installed, including jQuery, Backbone itself, and Underscore (a Backbone dependency). These are specified in `package.json`, which will act sort of like your Gemfile in a Rails app (with `npm install` taking the place of `bundle`).

For those with an unquenchable thirst for understanding, [Ada's Backbone scaffold repository](https://github.com/AdaGold/backbone-baseline) has additional details.

#### Relation to Backbone

Neither Babel nor webpack have anything to do whatsoever with Backbone!

You can use Backbone without them, and use them without Backbone - in fact, right now Backbone is installed, but we're not using it at all. So why are we jumping through all these hoops? Because we've been learning JavaScript for 2 whole weeks, and it's time to switch to a big kids development environment!

## Directory Structure

Let's take a look at the directory structure. We are interested in the root folder and the  `dist` and `src` folders. Both these folder names are completely arbitrary - you can see them specified in `webpack.config.js`.

Our Project structure will look like this, including hidden files:

TODO DPR update once finished

![Backbone Project Directory structure](images/backbone-baseline.png)

This is very different from what we did with Rails. JavaScript projects in general tend to be much more open-ended than an opinionated framework like Rails, and this is reflected in our directory structure. This flexibility is powerful, but it also means there's a lot for us to keep track of.

### The `dist` Folder: Mostly HTML

In the `dist` folder you'll find a file called `index.html`. This is the page that will be served to the browser. It should have everything we need already, but if you need to make changes this is the place to do it.

Though we shouldn't need to edit this file, we'll be looking at it a lot, so let's spend some time on it now. `dist/index.html` has three important components:
- A `<form>` to add a new book
- An empty `<table>` where we will list books
- An Underscore template for a row in the book table

#### Book Template

Forms and tables are old hat at this point, but let's dive into that Underscore template. You'll find it at the bottom of `index.html.erb`.

```html
<script type="text/template" id="book-template">
  <tr class="book">
    <td>
      <%- title %>
    </td>
    <td>
      <%- author %>
    </td>
    <td>
      <%- publication_year %>
    </td>
  </tr>
</script>
```

We'll do a quick recall activity with your chair pair to recall what we just learned about Underscore:
1. What are the three steps in creating an Underscore template?
1. Now that you know which steps you need, identify which of those steps we have completed and which we still need to complete.
1. What does it mean to "compile the template"? What code corresponds to this instruction (JavaScript lives in `src/app.js`)?
1. Does "compiling the template" directly result in the necessary HTML? If not, what else needs to be done to get the HTML?

#### Compiled JavaScript

Inside `dist` you'll also find two files called `bundle.js` and `bundle.js.map`. These are compiled JavaScript files with all the JavaScript code we are using. **These files are automatically generated by webpack** - you shouldn't need to modify them manually.

### The `src` Folder: JS and CSS

The `src` folder contains all our application's JavaScript and CSS.

As with the HTML, we've already prepared all the CSS we'll need for this live code. If you want to add any of your own styles, you'll do so in `src/style.css`.

For JavaScript, the "main" file is `src/app.js`. We'll be adding other files as we go to keep ourselves organized. In particular, note the `models`, `collections` and `views` folders - these will contain our Backbone components.

#### Existing JavaScript

Take a look at `src/app.js`. This is our "main" JavaScript file, where the code to drive our application will live. This file has a few important pieces.

TODO DPR: Diagram

```
-
|  Imports
-
-
| Variables
|
-
-
| Helper functions
|
-
-
| $(document).ready
-
```

##### Imports

At the top of the file you'll find the `import` statements. This is a webpack thing, and allows us to split our app into multiple files.

- CSS: We import Foundation as well as our app-specific styles. You can find these in `src/style.css`
- JavaScript: Right now we only import jQuery (`$`) and Underscore (`_`), but we'll be adding more here as we define Backbone components.

##### Variable Declarations

Next are variable declarations. We have two to start:

- `rawBookData` is a big array of raw JavaScript objects representing books. We'll use this as seed data for our app until we add API integration in a future lecture.
- `bookTemplate` is currently undefined. In `$(document).ready`, it will be set to our compiled Underscore template.

##### Helper Functions

After the variables come definitions of helper functions. Currently there is only one of these, `render`, which does nothing. This will change soon.

##### $(document).ready

Finally we find `$(document).ready`, the code that will run when the page has finished loading. This is where we'll put any code that interacts with the DOM, such as compiling Underscore templates, adding books to the page, and attaching event handlers to elements like the `<form>`.

One important thing to note is that there are no Backbone components in this file. Those will be defined in their own files, as we'll see shortly.

## Summary

- The BackBooks project uses Webpack as a development server
- HTML lives in `dist/index.html`
- JavaScript lives under `src/`, with `src/app.js` as the "main" file
  - We'll be adding more files here as we go

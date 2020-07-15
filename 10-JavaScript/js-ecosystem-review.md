# Reading Review: JS Ecosystem

This reviews [JavaScript Ecosystem](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/10-JavaScript/js-ecosystem.md) and [CRA Build System](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/React/cra-build-system.md)

## Why do we need a build system for our client-side JS projects?

1. What platform do client-side JS apps run on? This is _different_ compared to Ruby CLI programs, which run on Terminal/command line, and Ruby on Rails apps, which run on a Heroku server.
1. Without a build system, previously we have used a specific HTML tag to load a JS script, one-by-one, line-by-line. Which HTML tag loads a single JS script?
1. True or false: If your JS script named `index.js` is included into the html `index.html` with `<script src='index.js'>`, and your JS script `index.js` needs to use `axios` and 200 other JavaScript libraries, we can use a file `package.json` to load each of those JavaScript libraries. Assume that there is no build system.
1. True or false: We can assume that every browser supports and can run without error every feature/function/syntax that JavaScript as a language has implemented.
1. Minifying JS is a way to help make a web-app be more performant. Why does making a JS file smaller improve performance?

<details>

<summary>Answers!</summary>

1. The browser!
1. `<script>`
1. False... If there is no build system in place, for every library that our JS code relies on, we need to do one of the following things: add a `<script>` tag to the `index.html` to load in every JS library dependency, or [utilize ES6's modules to import files](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/import)
1. False, we cannot assume that every browser supports every feature of every version of JavaScript.
1. A smaller JS file is a smaller file size for a server to send to the browser, which is faster to load.

</details>

## Define and Match

Come up with a one sentence definition for each of these specific tools (you can use their official websites to come up with these)

1. `npm`
1. `webpack`
1. `Babel`
1. `Create React App`

`npm`, `Babel`, `UglifyJS` are involved with improving the JS ecosystem in one or many ways. Which tools match which of the benefits below?

- JS file/module management
- New JavaScript Features
- Performance

What is the tool that is used to combine, or _orchestrate_ all of the above tools?

<details>
  
<summary>Answers for matching!</summary>

1. `npm` helps with JS file/module management
1. `Babel` helps with New JavaScript Features
1. `UglifyJS` helps with performance
1. `webpack` orchestrates all of these tools!
  
</details>


## What is a Build?

Now that we have some context about why we need some tools, and some specific tools, let's wrap it all up into the bigger ideas.

Answer the following questions:

1. What does it mean to build a project? What is a build? In a client-side app that will run on the browser, assuming that there is no server to run specific code, what is an example of output would we want from a client-side app build?
1. What is the term for the entire set-up of tools that convert/improve code into a build?
1. Which of these tools is a _transpiler_? npm, webpack, Babel, Create React App
1. Which of these tools creates a bundle? npm, webpack, Babel, Create React App
1. Which of these tools manages dependencies? npm, webpack, Babel, Create React App
1. What is Create React App? What tools does it include?
1. If we wanted to change the configuration of an app made with Create React App, what would we need to do?
1. If we wanted to make a React App without using the Create React App tool, could we?

<details>

<summary>Answer!</summary>

1. A client-side browser app should eventually have a set of static html, css, and js files to run.
1. Build system
1. Babel
1. webpack
1. npm
1. Create React App is a tool that will generate a React project and a set of specific tools for a specific build system. It includes tools such as npm, Babel, webpack, and more!
1. To change the configuration of an app made with CRA, we would need to eject the configuration, and then look at its configuration files in the folders `config` and `scripts`
1. Yes, we can make a React app without Create React App

</details>

  
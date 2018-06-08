# JavaScript Ecosystem
The term "JavaScript ecosystem" is often used to refer to the array of different tools and configuration systems used for implementing a _build system_, generally for client-side projects including not only JavaScript code but also HTML, CSS, images and other data.

## Learning Goals
- Understand the purpose of a build system for client-side JS projects
- Understand the role of the following specific tools within a build system:
    - [npm](https://npmjs.com/)
    - [webpack](https://webpack.js.org/)
    - [Babel](https://babeljs.io/)
    - [webpack-dev-server](https://github.com/webpack/webpack-dev-server)
- Explore a complex build system setup by "ejecting" the build configuration from a `create-react-app` project

## What is a build system?
A build system for a software project is set of one or more programs (generally referred to as tools) that are usually connected by "script" code (written in a general programming language or one specific to a particular build system) which directs those tools to transform the project's source code and data files into a complete, deployable "package" for end users.

An example of one of these end-user packages is the [ZIP file](https://atom.io/download/mac) that you would download when installing Atom. Inside of that compressed archive was an `Atom.app` directory that represents the _built_ version of the Atom project. If you extract the archive and then right click on the Atom file it creates and select "Show Package Contents" you can explore what files are included and see that they are very different from what's in the [project's GitHub repo](https://github.com/atom/atom) (it is not important to understand the files, just be aware of the difference).

The need for a build system and the specifics of what it does are highly specific to each project and are often impacted by technology choices such as programming language, libraries used, and in particular the environment in which the program will be run by end users.

## Why do we need a build system for our client-side JS projects?
In truth we don't _always_ need a build system for a JS project -- we didn't use one with the jQuery projects! More practically however, real-world JS projects frequently become large enough to benefit from a build system.

The biggest reasons for needing a build system come from the fact that our code will actually be running within the user's web browser, rather than on our computer in the terminal or on a Heroku server as our Ruby projects did.

### JS file/module management
As we learned in the jQuery curriculum, the browser will only be able to download and run your JavaScript code if you include a `<script>` tag for each file somewhere in the HTML code. And the order of those tags is important because the code will be run in exactly that order.

Consider a scenario where we want to create a project that uses an existing JavaScript library -- much like we did on various occasions in Ruby with `gem` and `bundle` . When we used the `gem` command to download a library like `colorize`, where did the code files for it go? Thankfully Ruby and our development tools like `rvm` were able to seamlessly make this work without us having to know.

But with the web browser, we really need to know because our HTML file has to reference each one of the files in any library we intend to use. And when we deploy our project to a server, it needs to include all of those files as well as our own code.

This becomes tedious very quickly, and one of the major goals of a JS build system is to gather all of the code files used by a project and package them together into a smaller set of files (possibly just one). Some systems will also generate the necessary `<script>` tags for the HTML automatically.

### New JavaScript features
Another popular reason for using a build system in your JS project is to gain access to the latest features available in the language. This might seem unusual since you could just type some code into your editor using the new feature or syntax, so why is a separate tool needed?

Again, because of the web browser element. Even though you can type any code you'd like into your editor, and possibly even run it on your computer, for the actual users of your code it will only work if it runs on _their_ computer.

Many new features in JavaScript are officially part of the language, but there are currently no web browsers which actually support those features or they are only supported in very recent versions. In order to still use these features in our code we can use a build system tool that will translate our new-style code into equivalent old-style code that is guaranteed to work in more browsers.

## Tools in the modern JS ecosystem

## Create React App

## Resources
- Build systems are a key component in [build automation](https://en.wikipedia.org/wiki/Build_automation), which ties into DevOps concepts such as [continuous integration](https://en.wikipedia.org/wiki/Continuous_Integration) and [continuous delivery](https://en.wikipedia.org/wiki/Continuous_Delivery).

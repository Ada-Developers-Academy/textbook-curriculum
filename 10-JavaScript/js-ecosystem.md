# JavaScript Ecosystem
The term "JavaScript ecosystem" is often used to refer to the array of different tools and configuration systems used for implementing a _build system_, generally for client-side projects including not only JavaScript code but also HTML, CSS, images and other data.

## Learning Goals
- Understand the purpose of a build system for client-side JS projects
- Understand the terms listed in the [definitions table](#definitions)

## What is a build system?
A build system for a software project is a set of one or more programs (generally referred to as tools) that are usually connected by "script" code (written in a general programming language or one specific to a particular build system) which directs those tools to transform the project's source code and data files into a complete, deployable "package" for end users.

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

### Performance
The other major reason for using a build system with your JS project is to automatically improve the performance of your application. The most common way to improve performance with build tools is by reducing the actual size of the code that the user's browser must download.

This can be accomplished with "minifier" tools such as [UglifyJS](https://github.com/mishoo/UglifyJS2/tree/harmony). There are a wide variety of techniques employed by these tools, chief among them are removing all unnecessary white space (i.e. blank lines, comments, and spaces/tabs at the beginning of lines), and renaming all variables to be as short as possible.

Regardless of the techniques used the goal is always the same: Generate valid JavaScript code which behaves exactly the same as your source code, but requires fewer characters to represent. Usually this generated code is [not readable by humans](https://code.lengstorf.com/images/learn-rollup-05@2x.jpg).

## Tools in the modern JS ecosystem
* [npm](https://npmjs.com/) - Node Package Manager

  npm is the equivalent, for Node, of Ruby's RubyGems and Bundler projects. Its job is to provide access to a registry of existing open-source software (known as packages) and allow a project to specify which packages it depends upon.

  npm can be used on the commandline to perform various tasks, including installing all dependencies, adding new dependencies, and running pre-defined script commands (ala Rake).

  While npm was originally designed to work with Node for JavaScript that would run in the terminal (on your development machine or a server somwhere, like on Heroku), other tools in the build system have been created which allow us to now seamlessly use npm packages for our client-side JS projects as well.

* [webpack](https://webpack.js.org/) - Module Bundler

  webpack is the "main" tool in most modern JS build systems (there are, as always, alternatives). While it bills itself as a "module bundler", its role is actually closer to "build system manager/orchestrator". Most other build tools are added into the build system by including them into your webpack configuration files.

  webpack is also responsible for locating all the source files (referred to as "modules") in your project, sending those files to the appropriate tools for processing, and packaging all of the processed modules into a "bundle" of one or more files fit for deployment to end users.

  Given its role as the manager of the whole build system, webpack itself is actually a very generic tool that can do just about anything depending on its exact configuration and installed plugins. In the latest version of webpack as of this writing, version 4, there is a strong emphasis on allowing webpack to be used without any configuration by ensuring that the default options for everything are usable.

* [Babel](https://babeljs.io/) - JavaScript compiler

  Babel's job is to take JavaScript code written in a [newer version of JavaScript](https://babeljs.io/learn-es2015/) (known as ES6 or ES2015) and convert it to equivalent code in an older version of JavaScript (generally ES5) which has more universal support in web browsers.

  Babel is often used as the first stage by webpack when it processes your JS code files, followed possibly by minification and other transformations.

* [webpack-dev-server](https://github.com/webpack/webpack-dev-server)

  When we develop our client-side JS applications it's necessary to actually access the application through our browser locally, so that we can see the behavior of our code. One way to accomplish this might be to directly open the HTML file in our browser, as we did for our jQuery projects and when learning HTML and CSS.

  However, this approach has some downsides. Specifically, the browser is loading a _file_ URL which looks like `file:///Users/username/some/directory/to/a/file.html`, which is treated differently from an _http(s)_ URL. For large or potentially complex projects it's important to mimic the actual end-user experience as closely as possible so we really want the browser to access our site through HTTP just as it would any other website on the internet.

  In order to accomplish this we need to run a web server which will actually provide our HTML, CSS, JavaScript, and other files from a given URL (generally `localhost:3000` or similar). That is the purpose of the webpack-dev-server tool, specifically built to integrate with a webpack-based build system.

  In very complex applications the developers might modify this "dev server" to have custom behavior akin to an API, but for our purposes we just need to run it with the default setup. In this case the dev server can most closely be compared to running `rails server` for our Rails projects.

* [Create React App](https://github.com/facebook/create-react-app)

  Create React App is a tool that can be used to generate a project scaffold, specifically for a React project. This ties in with the JS scosystem because part of the scaffold that gets generated is a very thorough and well thought-out build system and configuration. All of the tools mentioned above are included in that system, for example.

  If you would like more detail on the build system and configuration used by Create React App, [check out our resource](../React/cra-build-system.md) on "ejecting" the configuration from a CRA-generated scaffold.

## General Tips
The JavaScript ecosystem evolves very quickly and the version of a tool such as webpack that was released six months ago may be very different from the version of that same tool released today. While it's not necessary to always use the latest version of everything (many experienced developers prefer to be cautious and wait for bugs to be worked out before upgrading their tools), it _is_ very important to be aware of what versions of everything you're using!

If your project is using webpack 1 it's critical that the documentation or tutorials you're reading for webpack are specifically intended for version 1. If you're using webpack 4, then make sure to find resources related to that version instead.

## Definitions
There's a lot of detail in the sections above, and while that can be helpful it's always good to have a quick reference. Consider the table below to be the core set of terms you should understand from this resource.

| Term | Definition |
|:-----|:-----------|
| build | (Verb) The process of converting source code files and other input data used by developers into another form appropriate for deployment or distribution to end users. (Noun) The files or packages resulting from the build process. |
| build system | An arrangement of usually multiple task-specific programs that actually perform the build process by modifying and/or converting source and other input data. |
| build configuration | One or more data files (e.g. JSON or XML) and/or ["script" files](https://en.wikipedia.org/wiki/Scripting_language) that specify how the build system is arranged and which input files/directories to use. |
| compiler | A program that reads source code in one language and produces **equivalent** code in another language (often [virtual machine bytecode](https://en.wikipedia.org/wiki/Bytecode) or a specific [machine language](https://en.wikipedia.org/wiki/Machine_code). |
| transpiler | A kind of compiler that converts from one _version_ of a language to a different version of that same language. Sometimes this is for performance improvements, or to make newer code compatible on older systems. |
| minifier | A kind of build system tool that is generally unique to JavaScript, this program takes JS source code as input and outputs equivalent JS source code with as few characters as possible. The effect is essentially that of compressing the file. |
| module | In JavaScript and webpack terminology this is a single "atomic" unit of data (usually JS code, sometimes CSS or an image) that can be combined with other modules into a bundle. Most often this corresponds to a specific file in your project repo. |
| bundle | In webpack, the resulting single JS file that contains all of the "bundled" modules' contents. Which modules are bundled together depends on the build configuration. |
| [npm](https://npmjs.com/) | A build/development tool that is primarily used for creating, downloading, and specifying dependency relationships of _npm packages_. npm packages are source code repositories with JS code usually, and are stored in the npm registry. The simplest way to think about npm is that it's a combination of RubyGems and Bundler. |
| [webpack](https://webpack.js.org/) | A build system tool for managing the entire build process, with the overall result of converting each _module_ in some way and eventually combining all modules into a _bundle_. This bundle, along with any static HTML files and other website elements (e.g. favicon) constitutes the total output of the build process. |
| [Babel](https://babeljs.io/) | A _transpiler_ for JavaScript that is intended to convert newer JS syntax (ES6+) into traditional JS syntax (ES5) for better compatibility across all browsers. |

## Resources
- Build systems are a key component in [build automation](https://en.wikipedia.org/wiki/Build_automation), which ties into DevOps concepts such as [continuous integration](https://en.wikipedia.org/wiki/Continuous_Integration) and [continuous delivery](https://en.wikipedia.org/wiki/Continuous_Delivery).
- [A recent tutorial on webpack 4](https://hackernoon.com/a-tale-of-webpack-4-and-how-to-finally-configure-it-in-the-right-way-4e94c8e7e5c1) that goes into depth about the tool's design and how to configure it.
- [Tutorial for creating a webpack-based build system from scratch](https://hackernoon.com/how-to-build-a-react-project-from-scratch-using-webpack-4-and-babel-56d4a26afd32) (this also uses webpack 4 and Babel).
- The [webpack documentation](https://webpack.js.org/concepts/) is also a great resource when builing your config (make sure that you're looking at the right version of the docs).

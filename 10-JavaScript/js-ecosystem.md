# JavaScript Ecosystem
The term "JavaScript ecosystem" is often used to refer to the array of different tools and configuration systems used for implementing a _build system_, generally for client-side projects including not only JavaScript code but also HTML, CSS, images and other data.

## Learning Goals
- Understand the purpose of a build system for client-side JS projects
- Understand the terms listed in the [definitions table](#definitions)
- Explore a complex build system setup by "ejecting" the build configuration from a `create-react-app` project

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

## Create React App
[Create React App](https://github.com/facebook/create-react-app) is a tool built by Facebook (the main developer of React itself) which is intended to create scaffolded React applications with a build system that has already been configured by them.

The build system that is included with Create React App (CRA) is webpack-based and includes all four of the tools mentioned above, plus _many_ others that we generally don't have to worry about. In fact, one of the best parts of the CRA design is that the build system configuration is completely hidden from us, so we don't have to worry extra files in our project code.

What happens, though, when you start your React project using CRA and then later find out you need to customize the build system? Well, CRA has an (irreversible) option for exposing the whole build system configuration. They call this option "ejecting" the configuration, and it basically adds several files into your project directory along with updating a few existing files like `package.json`.

Because CRA's build system configuration has been created by very experienced engineers and is very thorough, it can serve as a good example of what a real-world webpack configuration looks like. So let's make a temporary React project with CRA and then eject its config!

### Eject and examine the Create React App build configuration
First let's start by creating a new React project with CRA:

```bash
$ create-react-app cra-ejected
$ cd cra-ejected
$ git init
$ git commit -am "Initial React project"
```

Even though this is just a temporary project to be thrown away later, we're adding all of the files into Git so that we can more easily see exactly what has changed after ejecting the configuration.

Speaking of, we can now run the command `npm eject` and make sure to say yes when it asks for confirmation. It will take a minute or two and spam your terminal with lots of details about exactly what it's doing. We can ignore that information for now.

Once the ejection process has finished we can examine what actually changed by running `git status`. You should see something like:
```
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   package-lock.json
        modified:   package.json

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        config/
        scripts/

no changes added to commit (use "git add" and/or "git commit -a")
```

As you can see the `package.json` file was modified, and two new directories were added. All of the webpack config lives in the `config/` directory, specifically in the files `webpack.config.dev.js` and `webpack.config.prod.js` (there is also a config file specifically for webpack-dev-server).

For now it's not important to understand the contents of these config files, or even what changes have been made to `package.json` (which is akin to `Gemfile` but for npm). Just browse through them and get a feel for how many parts and specific configuration options are involved in a large, thorough build system configuration.

## General Tips
The JavaScript ecosystem evolves very quickly and the version of a tool such as webpack that was released six months ago may be very different from the version of that same tool released today. While it's not necessary to always use the latest version of everything (many experienced developers prefer to be cautious and wait for bugs to be worked out before upgrading their tools), it _is_ very important to be aware of what versions of everything you're using!

If your project is using webpack 1 it's critical that the documentation or tutorials you're reading for webpack are specifically intended for version 1. If you're using webpack 4, then make sure to find resources related to that version instead.

Lastly, while the above webpack config from Create React App may have seemed really intense and unapproachable, rest assured that it is the result of many, many developers' efforts to build and maintain that config -- and to make it useful for as broad an audience as possible.

In your personal projects, or your projects for work, it's very likely you can get away with a simpler configuration. And generally you will build that config piece-by-piece over time, adding in one new tool at a time when you end up needing it. Creating your build system in this incremental approach is vastly more approachable than starting with a huge one such as CRA's and trying to learn it all at once.

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

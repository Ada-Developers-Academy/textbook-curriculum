# Making a Node
## Learning Goals
- Walk through what's required to create a new Node project
- Talk about some of the conventions around organizing Node projects
- Set up jasmine for testing

## npm init && `package.json`
[npm init](https://docs.npmjs.com/cli/init) will, according to the docs, "ask you a bunch of questions, and then write a `package.json` for you".

The `package.json` file is a multi-purpose configuration file that describes the what, how, who, and dependencies of your code. Let's make a new package for the `Calculator` object we looked at before:

```bash
$ cd ~/C5/sandbox
$ mkdir calc-node && cd calc-node
$ npm init
```

Running `npm init` is fun and weird. Don't worry if you're not sure of the correct response to any of its questions. Everything is written to `package.json` and can be changed later. Take a moment to run through the questions:

```
This utility will walk you through creating a package.json file.
It only covers the most common items, and tries to guess sensible defaults.

See `npm help json` for definitive documentation on these fields
and exactly what they do.

Use `npm install <pkg> --save` afterwards to install a package and
save it as a dependency in the package.json file.

Press ^C at any time to quit.
name: (calc-node) 
version: (1.0.0) 0.0.1
description: I am for maths
entry point: (index.js) 
test command: 
git repository: 
keywords: math fun zomg addition yay
author: <3jnf
license: (ISC) MIT
About to write to /Users/jeremy/sandbox/calc-node/package.json
```

After all that, you should have a `package.json` in the directory that looks something like this:

```json
{
  "name": "calc-node",
  "version": "0.0.1",
  "description": "I am for maths",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [
    "math",
    "fun",
    "zomg",
    "addition",
    "yay"
  ],
  "author": "",
  "license": "MIT"
}
```

Technically, this is all you need to get started making applications in node. Practically, there's still some stuff to do. We told `npm init` that the _entry point_ for our application is `index.js`. So we'll need to create that. It's also a good idea to make a `.gitignore` with a couple of entries:

```bash
$ touch index.js
$ touch .gitignore
```

Open up your editor and add two lines to the `.gitignore`:

```plain
.DS_Store
node_modules/
```

The first line shouldn't need explanation; OS X loves it's `.DS_Store` files, but dang I don't want them in my repo. The second line, `node_modules/`, excludes any third-party packages from our repo. Folks working with our code later will install whatever dependencies we define themselves (more on that in just a moment).

## Exporting and requiring objects
Node's module system works by having individual files that _define_ and then _export_ a single object/function/class/construct. Any other code that needs the _exported_ functionality must _require_ the file. In the following example, we _define_ and then _export_ a small function:

```javascript
//repeater.js
function repeater(word) {
  return word + ' ' + word;
}

function not_exported() {
  console.log(" I'm not exported. :( ");
}

module.exports = repeater;
```

Now, any other file that needs the `repeater()` function can _require_ it:

```javascript
//index.js
var repeater = require('repeater.js'),
    my_word  = "brunch";

console.log(repeater(my_word)); //brunch brunch
```

The `module.exports` tells Node what, exactly, should be made available when the file is _required_ elsewhere.

## Dependencies in Node
Remember using `prompt`? We had to install it with `npm install prompt` and then `require` it into our file. Doing so created a `node_modules/` folder and automatically installed `prompt` and all its dependencies.

When we are building our own modules, we manage dependencies the same way, with one extra consideration. Since `prompt` is a dependency of our project, we want to make sure that other people working on our code know about it. So when we install `prompt`, we'll use the `--save` flag to write it into our `package.json` as a dependency: `npm install --save prompt`.

This will change our `package.json`. It'll add a `"dependencies"` key that looks like this:

```json
  "dependencies": {
    "prompt": "^1.0.0"
  }
```

Now anyone who uses our module can set up all the dependencies by running a plain `npm install` after cloning the repo. Without arguments, `npm install` will look for dependencies defined in a `package.json` and install any it finds.

### Development dependencies
Some dependencies are only applicable in certain environments. In Ruby, we would isolate some gems into a `:development` and/or `:test` group to make sure they weren't installed when the code ran in production. We do a similar thing in Node by defining some dependencies for development (which excludes them from production installation). An example is our testing framework, Jasmine. Let's install it for this project, but only when we're in development: `npm install --save-dev jasmine-node`. The `--save-dev` flag changes our `package.json` file again, but in a different way:

```json
"devDependencies": {
  "jasmine-node": "^1.14.5"
}
```

## Project Organization
Now we've got a place to "start" our application (`index.js`), a way to manage dependencies (`package.json` and `npm install`), it's time to build our custom functionality.

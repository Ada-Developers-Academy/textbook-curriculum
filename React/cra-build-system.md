# Create React App
[Create React App](https://github.com/facebook/create-react-app) is a tool built by Facebook (the main developer of React itself) which is intended to create scaffolded React applications with a build system that has already been configured by them.

## The CRA build system
The build system that is included with Create React App (CRA) is webpack-based and includes [all four of the tools mentioned in our build system resource](../10-JavaScript/js-ecosystem.md), plus _many_ others that we generally don't have to worry about. In fact, one of the best parts of the CRA design is that the build system configuration is completely hidden from us, so we don't have to worry extra files in our project code.

What happens, though, when you start your React project using CRA and then later find out you need to customize the build system? Well, CRA has an (irreversible) option for exposing the whole build system configuration. They call this option "ejecting" the configuration, and it basically adds several files into your project directory along with updating a few existing files like `package.json`.

Because CRA's build system configuration has been created by very experienced engineers and is very thorough, it can serve as a good example of what a real-world webpack configuration looks like. So let's make a temporary React project with CRA and then eject its config!

## Eject and examine the CRA build configuration
First let's start by creating a new React project with CRA:

```bash
$ create-react-app cra-ejected
$ cd cra-ejected
$ git init
$ git add .
$ git commit -m "Initial React project"
```

Even though this is just a temporary project to be thrown away later, we're adding all of the files into Git so that we can more easily see exactly what has changed after ejecting the configuration.

Speaking of, we can now run the command `npm run eject` and make sure to say yes when it asks for confirmation. It will take a minute or two and spam your terminal with lots of details about exactly what it's doing. We can ignore that information for now.

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

## Summary
Lastly, while the above webpack config from Create React App may have seemed really intense and unapproachable, rest assured that it is the result of many, many developers' efforts to build and maintain that config -- and to make it useful for as broad an audience as possible.

In your personal projects, or your projects for work, it's very likely you can get away with a simpler configuration. And generally you will build that config piece-by-piece over time, adding in one new tool at a time when you end up needing it. Creating your build system in this incremental approach is vastly more approachable than starting with a huge one such as CRA's and trying to learn it all at once.

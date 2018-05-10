# Introduction to React

## Learning Goals
- What is React?
- Why do we learn React?
- Who is using React?
- Intro to the Virtual DOM
- Intro to Components

## What is React?
React is an [open-source](https://github.com/facebook/react) JavaScript library for building user interfaces. It encompasses only the **V** in the MVC Pattern.

React is modular through the use of **components**. A component is an individual JavaScript class which represents the pieces of the user interface (HTML and CSS) and behavior (events via JavaScript). Each component manages it's own state and then components can be composed within one another to create a complete web application.

## Why React?
There are a lot of reasons that technology teams are switching to use React. You can read one of those from the Netflix team written a few years ago on their transition in the [Additional Resources](#additional-resources) below.

Here at Ada, we teach React because it equips you with these skills:
- Designing an application to leverage the constructs and patterns of a library
- Using syntax that you've already seen (with HTML & CSS) in a slightly different way with JSX
- Designing a modular application with individual pieces that fit together
- Understanding and building with a popular, modern front-end JavaScript library

## Who is using React?
React was originally developed by Facebook so they're the first one to mention. Also sites like Airbnb, Dropbox, Instagram and Netflix use React. You can read even more companies in the [Additional Resources](#additional-resources) below.

[This chart](http://bit.ly/2oLgGxF) is also a great indicator of how much more popular React has become over the past few years.

## Virtual DOM
One of the most enticing things about using React is the Virtual DOM. React provides a managed copy of our DOM to allow us to make quick changes to our DOM. It allows us to dynamically update our pages by doing a quick comparison between the Virtual DOM that React provides and the real DOM. Then, only the updates that are necessary are made.

## Components
React is made up of **Components** that work together. A very basic component can render some formatted HTML within your application. A more complex series of components can pull data in from a database or API, populate that into formatted HTML and render other components.

## Key Takeaway
React is extremely popular right now and is growing in popularity. The Virtual DOM makes React a desirable solution for web applications where performance and modular are in consideration.

## Additional Resources
- [React Virtual DOM](https://www.codecademy.com/articles/react-virtual-dom)
- [32 Sites Built with React](https://medium.com/@coderacademy/32-sites-built-with-reactjs-172e3a4bed81)
- [Netflix likes React](https://medium.com/netflix-techblog/netflix-likes-react-509675426db)

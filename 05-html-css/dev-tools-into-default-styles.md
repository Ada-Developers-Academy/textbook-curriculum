# Developer Tools & Default Styles

## Learning Goals 📚

- Use developer tools to identify default styles of elements
- Use developer tools to identify inherited styles of elements

## What are Developer Tools?

The Chrome Developer Tools (Dev Tools for short), are a set of web authoring and debugging tools built into Google Chrome. The Dev Tools provide web developers deep access into the internals of the browser and their web application.

Other Browsers, such as Firefox and Safari, have their own debugging developer tools. They are worth becoming familiar with as you begin to be aware of cross-browser compatibility. Because we are only developing with Chrome this week, we are going to focus specifically on Chrome's Developer Tools.


## Dive into Developer Tools!

Now that we've gotten deeper into HTML and CSS, let's explore more fully what Dev Tools can show us.

Reminder: you can open Dev Tools in Chrome with any of the following methods:
- right click on a page and click on 'Inspect' from the menu
- use the keyboard shortcut `cmd + opt + i`
- in Google Chrome, on the top menu, do View > Developer > Developer Tools


![Elements Tab in Dev Tools](imgs/dev_tools_elements_tab.png)
To start, click on the *Elements* tab. You should get something that looks like this:
![dev tools](imgs/dev_tools.png)
It should show you some HTML code of the page you are on in one panel and CSS in the other panel. This HTML code is reflecting your site's DOM (Document Object Model).

### The DOM
The Document Object Model (DOM) is a cross-platform and language-independent application programming interface that treats an HTML document as a tree structure wherein each node is an object representing a part of the document.

### Look at Element's Default Styles
In the HTML code panel, click on an element (a node of our DOM tree). The CSS panel should change to reflect the styles that are affecting that specific element.

The are various sources of CSS that are affecting that element.

## Vocab ✅
- DOM (Document Object Model)

## 🔑 Key Takeaway
Using Chrome's Dev tools should be a primary front-end debugging tool.

### Additional Resources
[DevTools Documentation](https://developers.google.com/web/tools/chrome-devtools/iterate/inspect-styles/?utm_source=dcc&utm_medium=redirect&utm_campaign=2016q3)

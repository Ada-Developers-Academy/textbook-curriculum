# ❮ Intro to HTML ❯


## 📚 Learning Goals 📚
- Understand HTML syntax & vocabulary
- Can identify what tags are most appropriate for specific content
- Can link to other html files



## HTML is the foundation for EVERY website
HTML structures the content of a webpage. Its purpose is to organize content.

HTML is not concerned about how the content *looks*. That job is left to CSS, which is a totally different language we will be learning later.

**Fun Tip** Add the [Web Developer](https://chrome.google.com/webstore/detail/web-developer/bfbameneiokkgbdmiekhjnmfkcnldhhm?hl=en-US) extension to chrome to see how sites look without any CSS!

![Web Developer Chrome Extension](imgs/web_developer.png)
After you add it, click on the icon (looks like a gear). A box will popup, click on the CSS tab towards the top left. Then there will be a checkbox you can click to disable CSS on any site your heart desires 💛. Have fun!


## HTML Syntax

Below is an HTML Element. Content of a website is 'wrapped' by an HTML element. It consists of an opening tag where the tag name is defined between the '<' and '>' symbols. The opening tag needs to be paired with a closing tag so the browser knows when to stop the formatting for that element. The closing tag will be the same as the opening but with a forward slash.

```html
<tag> Content </tag>
```
Real-life example of a header element for my social media site for cats:
```html
<h1> Meowspace </h1>
```

Sometimes tags will be nested inside of other tags. To maintain readable code, each tag should be on a new line with the nested element indented.

```html
<nav>
  <h1> Meowspace <h1>
</nav>
```
Being mindful of the relationship of nested elements will become important as we progress in the week.

## Setup an HTML Document

```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title> This site should have a title! </title>
  </head>
  <body>
    <!-- Your code goes here! -->
  </body>
</html>
```

**

## Validate your HTML
Validating Web documents is an important step which can dramatically help improving and ensuring their quality. Use this link to see if your HTML is following proper HTML grammar: [Markup Validation Service](https://validator.w3.org/nu/#textarea)

## Best Practices

- **NEVER** use inline styles.
- Use proper indentation
- All content should be wrapped by an element

## Vocab ✅
- Markup language
- Elements


## 🔑 Key Takeaway
HTML is only concerned about how content is structured. Nothing should be changing the appearance.

### Additional Resources

- []
- [Learn to Code: HTML & CSS](http://learn.shayhowe.com/html-css/building-your-first-web-page/) (Very well organized with nice visuals. Goes into a lot of depth. Will be a good resource to reference throughout week.)

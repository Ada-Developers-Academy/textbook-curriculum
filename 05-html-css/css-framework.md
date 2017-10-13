# CSS Framework: Zurb Foundation

## 📚 Learning Goals 📚
- Create a Responsive Grid-based Layout using Foundation


## What is a Front-end Framework?

Front-end frameworks (or CSS Frameworks) usually consist of a package made up of a structure of files and folders of standardized front-end code (HTML, CSS, JS ).

The usual components are:

- CSS source code to create a **grid**: this allows the developer to position the different elements that make up the site design in a simple and versatile fashion.
- Typography **style definitions** for HTML elements.
- **Browser compatibility** solutions so there is consistent style across browsers.
- Creation of standard **CSS classes** which can be used to style advanced components of the user interface.

The most popular frameworks are Bootstrap and Foundation. Here's [an article](https://www.upwork.com/hiring/development/bootstrap-vs-foundation-which-framework-is-right-for-you/) comparing the two Frameworks. We'll be digging into Foundation to focus on it's grid features.

By using Foundation's already made CSS code, we can more quickly setup a layout for our site by simply, yet strategically, adding classes to HTML elements!

NOTE: _CSS Frameworks_, like Bootstrap and Foundation are different that _Front-end JavaScript frameworks_ like React, Angular and Ember.

## Mobile First
As browsing on phones has increasingly become popular, so has the philosophy of designing mobile first.  Mobile first is planning the design of your site for a very small screen before anything else.

Doing so will help you concentrate on visual hierarchy and boiling your content down to what is most important.

![mobile first visual](http://metamonks.com/wp-content/uploads/responsive-vs-mobile-first-webdesign-022-1024x689.png)

That means creating separate wireframes for the different ways a user may interact with your site. Ex: A phone vertically, a phone horizontally, a large table in either direction, a laptop, a large-screen  television, I could go on forever!

In an effort to not overwhelm ourselves, we’ll only be concerned on three generic screen sizes: small, medium and large. We refer to the user's visible area of a web page as the **viewport**.

Think of small as a very narrow viewport, like your phone horizontally. Medium when you are split screening your laptop screen with your browser on one half and another application on the other. And large as your browser full-screen on your laptop.

## Grid Layout
A grid system is an invisible foundation of web page layout, which is used to divide the web page multiple grids.

![grid](https://designschool.canva.com/wp-content/uploads/sites/2/cache/2015/04/7_Grid1/7_Grid1-530x265.jpg)

Grids have long been used in design to provide structure and balance for content in a layout. Interested in learning more about grid theory? [Read this](https://designschool.canva.com/blog/grid-design/)


### Foundation uses a 12 column grid.
![Foundation Grid](http://foundation.zurb.com/assets/img/seo/feature-grid-1.png)

Any elements that you want to be in the same row with each require a parent element with the class of `row`.

Those sibling elements, nested inside of `row`, will then need to specify how many of those twelve columns they should take up, making sure not to not add up over twelve. These elements will use multiple classes to do so. The first is simply `columns`, the next a size with a number representing the amount of columns to take up.


```HTML
  <div class="row">
    <p class="small-3 columns"> </p>
    <p class="small-3 columns"> </p>
    <p class="small-6 columns"> </p>
  </div>
```
The number of columns to be taken up by an element can be specified by varied widths of a browser’s viewport. There is small, medium and large. Larger sizes will inherit from a smaller one if it is not specified.

```HTML
<div class="row">
<p class="small-6 medium-3 columns"> </p>
<p class="small-6 medium-3 columns"> </p>
<p class="small-12 medium-6 columns"> </p>
</div>
```
In the example above, our large screen sizes will be the same as the medium, since we did not specify large. When our view port reaches the breakpoint between medium and small, the third element will take up it’s own row and the first two will each be half of a row.

Click [this link](http://foundation.zurb.com/grid-1.html) to see it in action!

## Block Grid
If all elements within a row are going to have the same widths applied, using the block grid is more efficient.

The `row` will define the space each child element takes up. Instead of specifying the number of columns (like with the basic grid we worked with above), the set number is how many of those elements we want to be on a row.

Each child element will still require a class of `column` or `columns`. Both work, some prefer to use the singular with block grids and plural otherwise. Whatever you choose, be consistent!

```html
<ul class="row small-up-2 medium-up-3 large-up-6" >
  <li class="column"> </li>
  <li class="column"> </li>
  <li class="column"> </li>
  <li class="column"> </li>
  <li class="column"> </li>
  <li class="column"> </li>
  <li class="column"> </li>
  <li class="column"> </li>
</ul>
```
In this example, when a viewport has a large width there will be 6 columns per row, where each column contains one of the elements with the class 'column'.

That means a large screen size will have a top row with 6 of the <li> elements, with the remaining two in the 2nd row.

A medium screen size can have up to 3 <li> elements per row.
A small screen size can have up to 2 elements per row.

## More Grid Functionality
As usual, there is always SO SO SO much more to learn. Have a look the documentation for [Foundation's Grids](http://foundation.zurb.com/sites/docs/v/5.5.3/components/grid.html) and some articles, like [this one](https://scotch.io/tutorials/understanding-zurb-foundation-5s-grid-system)!

## Further Customization
It is typical to use Sass when developing with Foundation. Using Sass allows you to customize easily by setting variables, yes variables in CSS! It's amazing!

But we're not there yet.

Instead you can overwrite Foundations styles your own CSS files. You can also set some customizations before downloading with [this page](http://foundation.zurb.com/sites/download.html/).

**Note:** There is a rails-foundation gem that seamlessly incorporates foundation into a rails application. The gem has the assumption that you want to utilize most of foundation’s functionality and that you know Sass. It is not recommended to use this gem quite yet. It includes a lot more of foundation’s functionality that we have not covered and may be overwhelming while you’re working on a new project.  But hey, if you’re feeling adventurous, go for it!


## Add Foundation to your project
We will be taking a version of Foundation from the web and installing in into a Rails application.

1.  We can [download this specific version](https://cdnjs.cloudflare.com/ajax/libs/foundation/6.3.1/css/foundation.css) on this site. Note that the text loaded here is the CSS we will need so go ahead and select it all and copy it. Foundation made some breaking changes to a later version of Foundation, and so we'll be using an earlier version to ensure our usage of the grid layout is good.

1. Create a new CSS file in your Rails application under `app/assets/stylesheets`. Call this file `foundation.css`. Copy the contents of the copied file in step 1 into this file.

1. Reload a page in your browser in your Rails application and verify that it looks different! Foundation should modify some default styles and fonts so you should be able to tell right away.

That's it!

## Best Practices
- NEVER change any CSS in Foundation's documents
  - It's _okay_ to override them, if necessary, but do so in your own CSS documents.
- Comment your HTML & CSS by sections to stay organized
- Keep Validating your HTML Code!

## Vocab ✅
- Mobile First
- Grid Layout
- Viewport


## 🔑 Key Takeaway
Using a front-end framework like Foundation or Bootstrap will allow you to more rapidly develop a structured visual layout that responsively changes across varied screen sizes.

### Additional Resources
- [Treehouse's Beginners Guide to Foundation 5 Grids](http://blog.teamtreehouse.com/beginners-guide-grids-zurb-foundation-5)
- [Columns: Using Small Medium and Large](http://zurb.com/university/lessons/using-small-medium-and-large-in-a-foundation-for-sites-grid
)
- [Media Queries Documentation](https://developer.mozilla.org/en-US/docs/Web/CSS/Media_Queries/Using_media_queries
)
- [12 video series on making a basic site with Foundation](https://www.youtube.com/watch?v=2QcpR6cHpnk&list=PL6oNLEZTnXsg2f3scFapWJsjywyMKpsF9
)
- [Foundation Templates](http://foundation.zurb.com/templates.html
)

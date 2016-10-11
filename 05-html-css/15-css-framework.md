# CSS Framework: Zurb Foundation

## 📚 Learning Goals 📚
- Create a Responsive Grid-based Layout using Foundation


## What is a Front-end Framework?



By using Foundation's already made css code, we can more quickly setup a layout for our site by strategically adding classes to html elements.

## Mobile First


## Grid Layout
A grid system is an invisible foundation of web page layout, which is used to divide the web page multiple grids.

![grid](Img:https://designschool.canva.com/wp-content/uploads/sites/2/cache/2015/04/7_Grid1/7_Grid1-530x265.jpg)

Grids have long been used in design to provide structure to provide foundation and balance for layout out content. Interested in learning more about grid theory? [Read this](https://designschool.canva.com/blog/grid-design/)


![Foundation Grid](http://foundation.zurb.com/assets/img/seo/feature-grid-1.png)

Foundation uses a 12 column grid by default.

Any elements that you want to be in the same row with each require a parent element with the class of “row".

Those sibling elements, nested inside of row, will then need to specify how many of those twelve columns they should take up, making sure not to not add up over twelve. These elements will use multiple classes to do so. The first is simply ‘columns’, the next a size with a number representing the amount of columns to take up.


```HTML
  <div class="row">
    <p class="small-3 columns"> </p>
    <p class="small-3 columns"> </p>
    <p class="small-6 columns"> </p>
  </div>
```
The amount of columns to be taken up by an element can be specified by varied widths of a browser’s viewport. There is small, medium and large. Larger sizes will inherit from a smaller one is not specified.

```HTML
<div class="row">
<p class="small-6 medium-3 columns"> </p>
<p class="small-6 medium-3 columns"> </p>
<p class="small-12  medium-6 columns"> </p>
</div>
```
In the example above, our large screen sizes will be the same as the medium, since we did not specify large. When our view port reaches the breakpoint between medium and small, the third element will take up it’s own row and the first two will each be half of a row.

## Block Grid

If all elements within a row are going to have the same widths applied, using the block grid is more efficient.

The row will define the space each child element takes up. Instead of specifying the amount of columns (like with the basic grid we worked with above), the set number is how many of those elements we want to be on a row.

Each child element will still require a class of ‘column’ or ‘columns’. Both work, some prefer to use the singular with block grids and plural otherwise. Whatever you choose, be consistent!

```html

```


## Grid Nesting


## Further Customization
It is typical to use Sass when developing with Foundation. Using Sass allows you to customize easily by setting variables, yes variables in CSS! It's amazing!

But we're not there yet.

Instead you'll have to overwrite Foundations styles in the app.css. You can also set some customizations before downloading on [this page](http://foundation.zurb.com/sites/download.html/).



## Best Practices
- NEVER change any CSS in Foundation's documents
  - It's _okay_ to override them, if necessary, but do so in your own CSS documents.
- Comment your HTML & CSS by sections to stay organized
- Keep Validating your HTML Code!

## Vocab ✅
- Mobile First
- Grid Layout


## 🔑 Key Takeaway
Using a front-end framework like Foundation or Bootstrap will allow you to more rapidly develop a structured visual layout that responsively changes across varied screen sizes.

### Additional Resources
- [Columns: Using Small Medium and Large](http://zurb.com/university/lessons/using-small-medium-and-large-in-a-foundation-for-sites-grid
)
- [Media Queries Documentation](https://developer.mozilla.org/en-US/docs/Web/CSS/Media_Queries/Using_media_queries
)
- [12 video series on making a basic site with Foundation](https://www.youtube.com/watch?v=2QcpR6cHpnk&list=PL6oNLEZTnXsg2f3scFapWJsjywyMKpsF9
)
- [Foundation Templates](http://foundation.zurb.com/templates.html
)

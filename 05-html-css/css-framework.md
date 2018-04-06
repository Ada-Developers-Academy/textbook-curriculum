# CSS Framework: Zurb Foundation

## 📚 Learning Goals 📚
By the end of this lesson you should be able to:
- Explain the use of a CSS framework like Foundation
- Use Foundation to apply standard styles to common HTML elements
- Use Foundation to apply styling and validation to HTML form elements


## What is a Front-end Framework?

Front-end frameworks (or CSS Frameworks) usually consist of a package made up of a structure of files and folders of standardized front-end code (HTML, CSS, JS ).

The usual components are:

- CSS source code to create a **grid**: this allows the developer to position the different elements that make up the site design in a simple and versatile fashion
- Typography **style definitions** for HTML elements
- **Browser compatibility** solutions so there is consistent style across browsers
- Creation of standard **CSS classes** which can be used to style advanced components of the user interface

The most popular frameworks are Bootstrap and Foundation. Here's [an article](https://www.upwork.com/hiring/development/bootstrap-vs-foundation-which-framework-is-right-for-you/) comparing the two Frameworks. We'll be digging into Foundation, but the concepts apply to both frameworks.

Foundation does provide a grid framework so developers can more quickly setup a layout for their site by simply, yet strategically, adding classes to HTML elements!

NOTE: _CSS Frameworks_, like Bootstrap and Foundation are different from _Front-end JavaScript frameworks_ like React, Angular and Ember.

## Mobile First
As browsing on phones has increasingly become popular, so has the philosophy of designing mobile first.  Mobile first is planning the design of your site for a very small screen before anything else.

Doing so will help you concentrate on visual hierarchy and boiling your content down to what is most important.

![mobile first visual](http://metamonks.com/wp-content/uploads/responsive-vs-mobile-first-webdesign-022-1024x689.png)

That means creating separate wireframes for the different ways a user may interact with your site. Ex: A phone vertically, a phone horizontally, a large table in either direction, a laptop, a large-screen  television, I could go on forever!

In an effort to not overwhelm ourselves, we’ll only be concerned on three generic screen sizes: small, medium and large. We refer to the user's visible area of a web page as the **viewport**.

Think of small as a very narrow viewport, like your phone horizontally. Medium when you are split screening your laptop screen with your browser on one half and another application on the other. And large as your browser full-screen on your laptop.

## Grid Layout
A grid system is an invisible foundation of web page layout, which is used to divide the web page multiple grids.

![grid](imgs/7_Grid1-530x265.jpg)

Grids have long been used in design to provide structure and balance for content in a layout. Interested in learning more about grid theory? [Read this](https://designschool.canva.com/blog/grid-design/)


### Foundation uses a 12 column grid.
![Foundation Grid](http://foundation.zurb.com/assets/img/seo/feature-grid-1.png)

At Ada we will continue to use CSS Grid & Flexbox for layout, but it's important to know that many sites use CSS framework layouts like the 12 column grid foundation layout.  If you want to learn more about Foundation's XY-Grid you can check [this out](https://foundation.zurb.com/sites/docs/xy-grid.html).  One nice advantage to Foundation's grid system is that it can be easier to make responsive to varying screen sizes.

## Add Foundation to your project

 When choosing to use Foundation in a Rails project you can select to either:
 1.  Manually copy and include all the CSS, JavaScript and SCSS files into your project.
 2. Use a provided [foundation-rails](https://github.com/zurb/foundation-rails) gem.

We will take the expedient of using the Gem, and placing it into our [`.rails-template.rb`](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/09-intermediate-rails/reference/.rails-template.rb) file.  

Open your `rails-template.rb` file and copy the content of [this file](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/09-intermediate-rails/reference/.rails-template.rb) and use it to **replace** all the content of the template file.

The updated template adds the following content:

```ruby
...
gem 'foundation-rails'
...
# Run rails generate foundation:install
  generate "foundation:install", "--force"
...
# Add Foundation Javascript with Motion-ui this must be run after
# rails generate foundation:install, because that command
# adds foundation_and_overrides.scss
inject_into_file 'app/assets/stylesheets/foundation_and_overrides.scss', after: '// @include motion-ui-animations;' do
<<-'RUBY'

@import 'motion-ui/motion-ui';
@include motion-ui-transitions;
@include motion-ui-animations;

RUBY
end
```

The template first adds the `foundation-rails` gem to the gemfile.  Then it runs a command to generate a bunch of CSS and JavaScript files.  Lastly it adds some code to `foundation_and_overrides.scss` in the stylesheets folder to include some libraries for animated menus and transitions.

---
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
- [Foundation XY Grid Video](https://www.youtube.com/watch?v=Xl5DjEzKn1g&t=3s)
- [Media Queries Documentation](https://developer.mozilla.org/en-US/docs/Web/CSS/Media_Queries/Using_media_queries
)

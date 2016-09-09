# Content Hierarchy with HTML5


## 📚 Learning Goals 📚
- Can organize content using semantic HTML5 tags
- Know why we organize content with semantic HTML5 tags


## But why?
These allow you to organize your document content into logical topical sections.

They bring a big advantage for people having HTML5 browsers and needing the structure to help them understand the page, for instance people needing the help of some assistive technology.


## Sectioning Elements

```html
  <body> </body>

  <div> </div>

  <section> </section>

  <article> </article>

  <nav> </nav>

  <aside> </aside>

  <header> </header>

  <footer> </footer>
```
### Think, Pair, Share

Take some time to research how to use each of the above tags.
Then discuss with your chair pair.
And then high five each other 🖐

## Organize content with Sectioning Elements
Sectioning elements wrap around the elements we have already been working with. This will not change anything visually.


![Sectioned Elements Diagram](imgs/section_elements.gif)
![Sectioned Elements Diagram](imgs/section_elements2.png)


## Elements Hierarchy
When elements become nested inside of each other they start to form relationships. An element that is inside of an other is a child-element, while the one wrapping is the parent.
```html
<body>
  <header>
    <h1><a href="index.html"> Meowspace </a></h1>
  </header>
  <article>
    <h2> You're Meowsome  </h2>
    <p>
      Soft kitty warm kitty little ball of furr but hide when guests come over, for gnaw the corn cob purr for no reason. Lies down knock over christmas tree but kitty ipsum dolor sit amet, shed everywhere shed everywhere stretching attack your ankles chase the red dot, hairball run catnip eat the grass sniff or massacre a bird in the living room and then look like the cutest and most innocent animal on the planet, and hide head under blanket so no one can see. Kitty power!
    </p>
  </article>
  <footer>
    <h3> &copy; 2016 </h3>
  </footer>
</body>
```

![Content Hierarchy Diagram](imgs/content-hierarchy-diagram.png)


Draw a hierarchy tree for the html code below:
```html
  <body>
    <header>
      <h1> Meowspacee </h1>
      <nav>
        <ul>
          <li><a href="#"> Login  </a></li>
          <li><a href="#"> Signup </a></li>
        <ul>
      <nav>
    <header>
    <section>
      <article>
        <h2> Everybody Wants to be a Cat </h2>
        <h3> By: Tiger </h3>
        <p> Leave hair everywhere. Wake up wander around the house making large amounts of noise jump on top of your human's bed and fall asleep again poop in the plant pot all of a sudden cat goes crazy, so pee in the shoe. Cat is love, cat is life eat owner's food human is washing you why halp oh the horror flee scratch hiss bite or paw at your fat belly. </p>
        <p> This human feeds me, i should be a god love to play with owner's hair tie. Kitty power! see owner, run in terror all of a sudden cat goes crazy. Attack feet russian blue so intently sniff hand. Leave hair everywhere. Wake up wander around the house making large amounts of noise jump on top of your human's bed and fall asleep again poop in the plant pot. Destroy couch as revenge. </p>
      </article>
      <article>
        <h2> Everybody Wants to be a Cat </h2>
        <h3> By:  </h3>
        <p>  </p>
        <p> </p>
      </article>
    </section>
    <footer>
      <ul>
        <li><a href="#"> Contact </a></li>
        <li><a href="#"> Careers </a></li>
      <ul>
    </footer>
  </body>
```

## Vocab ✅
  - Semantic
  - Sectioning


## 🔑 Key Takeaway

The new semantic elements introduced in HTML5 bring the ability to describe the structure and the outline of a web document in a standard way.


### Additional Resources

- [Treehouse Blog Post](http://blog.teamtreehouse.com/use-html5-sectioning-elements) (freely available)

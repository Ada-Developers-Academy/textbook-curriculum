#Alternate Text

Alternate text, or alt text, provides a textual alternative to non-text content in web pages. Most commonly seen as an attribute of `<img>` elements (`<img alt="descriptive text" src="photo-file.png">`). Alt text can also be presented in the context of the image itself (in a `<figcaption` for example).

##Functions of alt text:
- Alt text is important for folks who use screen readers to understand the context and content of all elements in a website.
- Alt text shows up in place of an image if the image fails to load or the user has chosen to disable images.
- Alt text provides semantic meaning for internet spiders to accurately assess the contents of a site, which is helpful for SEO.

##How to write good alt text:
- Describes content AND function
- Concise and not redundant
- If text in the alt attribute is unnecessary, you *must* still use the alt attribute, but with an empty string:
`<img>` elements (`<img alt="" src="photo-file.png">`

Let's do a few examples for funs, then we'll get into more detail:

![""](http://static.boredpanda.com/blog/wp-content/uploads/2014/05/funny-animals-doing-yoga-18.jpg)

![""](http://boredomtherapy.com/wp-content/uploads/2015/04/22-fake-animal-hybrids.jpg)

![""](https://pbs.twimg.com/media/B59UpYnCAAETNMI.jpg)

##More on good alt text:
- The context of the image is everything
  - Is the image purely decorative?
  - Does image convey information important to the associated content?
  - Is the image linked?
- There is no need to say 'link to...' or 'image of...'. The screen reader will announce this based on the tag.

##More examples, this time from the internets:
[Examples from WebAIM]http://webaim.org/techniques/alttext/

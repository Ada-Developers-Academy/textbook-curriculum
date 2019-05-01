# OAuth Continued

## Learning Goals

At the end of this lesson, students should be able to

- know the roles of various servers in OAuth
- understand with more detail how OAuth protects users

## What We Know Now

Our current understanding of OAuth shows that there are the following actors:

- User
- OAuth Provider/OAuth Service
- Client App

### Exercise

With a group, use a whiteboard. Create a diagram that describes the following user flow:

> Devin visits our Ada Books app for the first time. She presses the link that says "Log in with GitHub". The link takes her to GitHub.com, and she signs in and authorizes the app to access her GitHub user details. The website redirects her back to the Ada Books app.

Include/label the following entities on the diagram:

- User
- OAuth Provider
- Client App
- Router
- Controller
- Session

<details>

  <summary>
    Afterwards, check your answers here!
  </summary>

  - Devin is the user!
  - the OAuth Provider is GitHub
  - Client App is Ada Books/the Rails app
  - The router is part of the client app
  - The controller is part of the client app
  - Session is part of the client app

</details>

## The Detail

The dance that happens behind the scenes has a few more steps. Go through [this slideshow](https://docs.google.com/presentation/d/1lIQ4F8gpXwaIEBHlsussoIEN31sqCY2upGIV_L81zi4).
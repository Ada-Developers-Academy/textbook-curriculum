# Introduction to OAuth

Today we will introduce a technology called *OAuth*, which we will use to allow users to log into our Rails app. OAuth is short for **Open Authentication**, and it is an open standard that describes how users can use one service to log into another. If you've ever logged into a website using Facebook, you've used OAuth.


## Learning Goal
By the end of this lesson, students should be able to...

- Differentiate between Authentication and Authorization
- Describe how the OAuth protocol works at a high level
- Identify the different roles in the OAuth workflow
- Explain the advantages of using OAuth instead of building a custom login system

## Introduction

Security is a deep and nuanced field, but for our purposes there are two important pieces to get right:
- **Authentication:** Who are you, and how can I trust you?
- **Authorization:** Are you allowed to do that action?

OAuth is an **authentication** framework.  Using OAuth a user can securely **authenticate** (log in) to a service like Github, Google or Facebook, and allow another service, like our Rails App, to access the user's profile. So users log into one service, and use that account to log into other services.

If you've ever followed a link to "log in with Facebook" (or Google, Twitter, GitHub, etc) then you've used OAuth.

![Log in with Facebook button](images/oauth_in_the_wild.png)

Once our Rails app has authenticated a user via OAuth, it can make decisions about whether that user is **authorized** to take various actions on the site.

The alternative to OAuth is building your own system to manage credentials, and having the user log in with a username and password. However, providing a secure way for users to authenticate is complex, difficult and risk-laden. Using OAuth, we can delegate authentication to another service so we can rely on that service's security rather than build and maintain our own.

## OAuth Roles

In an OAuth application the following entities play roles in the process.

* The **User** is the person using the browser to access the site.
* The **Client** is an application which wants access to the user's account. For us this means the Rails server that we have built. Note that the Rails _server_ is an OAuth _client_.
* The **OAuth Provider** is the service providing OAuth access to the client. For us this means GitHub. It hosts the user accounts and provides information about the user to clients.

## Authorization Process

Before the client site can use OAuth from the provider, the client must be registered with the provider.  This is something you the engineer will do manually by visiting GitHub's website.  When the client registers it provides a callback URL, a website (for a web app) and an application name.  In return it receives a **Client ID** and **Client Secret**.  

The **Client ID** is a publicly available string which identifies the service with the API and the **Client Secret** is kept hidden, like a password and used to authenticate with the service.

![OAuth Process](./images/auth_code_flow.png )

### In the authorization process:

1. The User clicks on the link to, "login by **Github**" on the Client website (our Rails app).
1. Next the Client application redirects the user to the **Authorization Server** (Github).
1. The **Authorization Server** (Github) responds by asking the user to grant the client (our Rails app) access to the requested data.  This can be as simple as the user's identity and email, but could include other data.
1. If the user grants access the Authentication Server (Github) redirects the user to a specific **callback** address on the client (our Rails App).  This redirect includes an **authorization code** from the Authentication Server (Github).
1. Next the Client (our Rails app) will request an access token from the Authorization Server (Github) using it's **secret key** and **authorization code** to verify it's identity.
1. The authorization server (Github) responds with an **access token** to use in this session.
1. Then the Client (our Rails app) can request information from the OAuth provider with it's **access token**.

## After Authorization

After the authorization process completes the client (our Rails app) application has access to the requested data from the user's profile and can then associate that user with an account on the client application (our Rails app).  

## Resources
-  [OAuth2 Overview](https://www.digitalocean.com/community/tutorials/an-introduction-to-OAuth-2)
- [OAuth2 Video](https://youtu.be/CPbvxxslDTU)

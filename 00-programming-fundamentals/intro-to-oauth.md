
# Introduction to OAuth

## Learning Goal
You should be able to:
*  Explain the OAuth workflow and how an OAuth service can provide authentication and information about a user.

## Introduction

OAuth is an **authorization** framework, meaning it allows a user to grant access to their user account in one service (the OAuth provider) to another (the client).  An **authentication** framework on the other hand is a method for someone to prove their identity, usually with a username/password, but could be with touch-id, or even a QR code.  At Ada we will primarily use OAuth to use another service (Github) to authorize our sites to gather information about the user, such as their username.  So users will log into Github's site (authentication) and then authorize Github to give our apps information about themselves, allowing our site to securely know who is requesting access to our service.  

## OAuth Roles

In an OAuth application the following entities play roles in the process.

* The **User** is the person using the browser to access the site.
* The **Client** is an application which wants access to the user's account.  
* The **OAuth Provider** is the service providing OAuth access.  It maintains the following services.  
  * The **Resource Server** is a server managed by the provider which hosts the user accounts.  
  * The **Authorization Server** verifies the user's identity and provides access tokens to the client.

## Authorization Process

Before the client site can use OAuth from the provider, the client must be registered with the provider.  When the client registers it provides a callback URL, a website (for a web app) and an application name.  In return it receives a **Client ID** and **Client Secret**.  

The **Client ID** is a publicly available string which identifies the service with the API and the **Client Secret** is kept hidden, like a password and used to authenticate with the service.

![OAuth Process](./images/auth_code_flow.png )

### In the authorization process:

1. The User clicks on the link to, "login by **Github**" on the Client website.
1. Next the Client application redirects the user to the **Authorization Server**.
1. The **Authorization Server** responds by asking the user to grant the client access to the requested data.  This can be as simple as the user's identity and email, but could include other data.
1. If the user grants access the Authentication Server redirects the user to a specific **callback** address on the client.  This redirect includes an **authorization code** from the Authentication Server.
1. Next the Client will request an access token from the Authorization Server using it's **secret key** and **authorization code** to verify it's identity.
1. The authorization server responds with an **access token** to use in this session.
1. Then the Client can request information from the OAuth provider with it's **access token**.

## After Authorization

After the authorization process completes the client application has access to the requested data from the user's profile and can then associate that user with an account on the client application.  

## Resources
-  [OAuth2 Overview](https://www.digitalocean.com/community/tutorials/an-introduction-to-OAuth-2)
- [OAuth2 Video](https://youtu.be/CPbvxxslDTU)

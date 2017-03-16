# API Tools

## Learning Goals
- Identify the need for tools to assist with making API requests
- Play with `curl`
- Play with Postman

### Tools Intro
Making API requests from your browser directly (typing in a URL) has it's limitations. Oftentimes, API requests require you to pass in additional data (params) or use HTTP Verbs other than `get` (which is all your browser can give you). There are many different ways to interact with APIs that give you much more control.

### curl
`curl` is a command you can run in your terminal that will allow to you make HTTP requests. Note that `curl` is extremely powerful and does a lot more than what we'll show, but will act as a starting point for us right now.

In the most basic way, `curl` allows you to retrieve output from HTTP requests.

The response from Google:
```bash
$ curl http://www.google.com
```

A much more complex example, passing params in on a post request:
```bash
$ curl -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"id":100}' http://localhost:3000/api/data/
```


### Postman
[Postman](https://www.getpostman.com/) is a browser plug-in or standalone app that you can utilize to send API requests. This is much better than `curl` (in someone's opinion) because it provides a user interface to interact with your requests as well as responses. Postman also keeps a history of requests for you so you can track your progress.

#### Using The Native Mac Postman App

To use the Postman Native App you can download it from [getpostman.com](https://www.getpostman.com) and download the App.  You can paste it into your Applications folder to install it.  [It has a few advantages over the Chrome extension](https://www.getpostman.com/docs/why_native).

![Postman in Applications Folder](images/postman1.png)

The Postman App has two main sections.  The left **Sidebar** keeps track of previously created requests.  The main section is called the **Request Editor** and in that section you can put together an API request, run it and view the results.  

![Postman App Screen](images/postman2.png)

##### Getting a Normal Webpage

In the URL Bar place:  https://www.google.com/ and click **Send**.  

![Getting Google](images/postman3.png)

Take a look at the Body, Cookies & Headers returned.  Postman sends http requests just like a browser, but it lets you examine the content more easily and tailor your requests to examine the response.  Notice the cookies returned, which Google uses to track your session across their site.  

In the Header section you can see the Content-Type `Content-Type →text/html; charset=ISO-8859-1` which tells the client which type of information is being returned.  

#### Reading from a JSON API

You can also use the iTunes API to search for content on Apple's platform.  

In the URL bar enter:  `https://itunes.apple.com/search?term=` followed by anything you want to search by.  If your term has spaces or other characters not allowed in a URL, you can highlight the term and right click to make it URL friendly.  Select `Encode URI Component`  

![Encode URI Component](images/postman11.png)

So `https://itunes.apple.com/search?term=Red Hot Chili Peppers` becomes `https://itunes.apple.com/search?term=Red%20Hot%20Chili%20Peppers`

Examine the results.  Can you find links to album covers?  What about music samples?

### Slack API With Postman

Slack, the chat program we all know and love has a robust [API](https://api.slack.com) that the Slack App uses to function.  It's a great way to learn how APIs work and experiment with Postman.

Take a look at the [Slack API Page](https://api.slack.com/).  To use the Slack API you have to **authenticated** which means in this case that you'll need a token which is essentially a password for accessing the API.  

#### Pick Up A Temporary Token for the Slack API

You can go [here](https://api.slack.com/docs/oauth-test-tokens) and register for an oAuth token to test with the API.  
![slack API Key](images/postman-slack1.png)

This is essentially your password to use the API.  **Do not post** or otherwise make it publicly available.  

Next we can make a call on some of the Slack Methods.  

#### Starting with Testing!

To start in the URL bar we can run the Slack Test method to learn how to call the API and how to use parameters.  The Slack test method essentially parrots what we send it back to us in JSON form.  

Go to the address bar and enter:  [https://slack.com/api/api.test?foo=bar](https://slack.com/api/api.test?foo=bar) 

Then hit submit you should get the following response:

```json
{
  "ok": true
}
```

Next click on the Params button

![params button](images/params.png)  

Add the following key and value.  `foo: bar`

![foobar](images/foobar.png)

Then hit **send**.  What do you get?

```json
{
  "ok": true,
  "args": {
    "foo": "bar"
  }
}
```

Notice what happens to the URL line:  `https://slack.com/api/api.test?foo=bar`  The parameters go into the url line.   These are called **get parameters**. For most other requests we will need to add another parameter called `token` and give it the value of our oAuth token.   

#### Listing Slack Users

Take a look at the Slack API Documentation for the [users.list](https://api.slack.com/methods/users.list) method.  This method, unlike test, requires the authentication token.  

Enter `https://slack.com/api/users.list` in the URL bar and the authentication token as a parameter.  Then hit submit.  

-  What do you get?
-  What happens when you leave off the token?


You should have a JSON object returned as a response with the details of the users or a response indicating failure.  

#### Experimenting on your own:

With your chair partner take a look at the [Slack API](https://api.slack.com/methods) and try to use some of the other methods.  Try other parameters the API Docs show you.

## Resources
- [TutorialsPoint curl docs](https://www.tutorialspoint.com/unix_commands/curl.htm)  
- [Sending Requests with Postman](https://www.getpostman.com/docs/requests)
- [Github API](https://developer.github.com/v3/)

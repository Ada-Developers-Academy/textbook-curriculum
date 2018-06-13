# Deploying a create-react-app Project to Github Pages

## Learning Goals
By the end of this lesson you should be able to

-   Deploy a React Application to Github Pages.

## Installing `gh-pages` Package

There is an npm package created to assist in deploying a create-react-app project to Github pages.  You can install it with:

```bash
npm install gh-pages --save-dev
```

## Updating `package.json`

To use this package to deploy your app you will need to add a property to `package.json`

```json
//...
"homepage": "http://<USERNAME>.github.io/<REPO_NAME>"
```

-   Replace:  <USERNAME> with your github username.
-   Replace:  <REPO_NAME> with the name of your github repository.


Next add two new attributes to the `"scripts"` object:

```json
"scripts": {
  ...
  "predeploy": "npm run build",
  "deploy": "gh-pages -d build"
}
```

## Deployment

Then add and commit your repository and you can deploy your app with:

```bash
npm run deploy
```

Notice that now you have a branch on your repository named `gh-pages` which holds the _built_  application code.

## Resources
-  [Source of this resource](https://github.com/gitname/react-gh-pages)
-  [Facebook's tutorial on deployment](https://github.com/facebookincubator/create-react-app/blob/master/packages/react-scripts/template/README.md#github-pages)

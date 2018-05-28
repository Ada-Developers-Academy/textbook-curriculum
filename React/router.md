## Raw Notes

Routes
https://medium.com/@harinilabs/day-2-react-router-state-and-props-301ca55c5aaf

`npm install -g react-router`

In our existing `index.js` file, we are going to swap out the `App` component that we are rendering and instead render the `Router`, which will handle all of our application's routes.

```javascript
ReactDOM.render(
  <Router>{routes}</Router>,
  document.getElementById('app')
)
```


Create the **router instructions** file which will indicate which routes will navigate to which components. `app/config/routes.js`

```javascript
module.exports = (
  <Route path="/" component={App}>
    <Route path="//profile/:username" component={Profile} />
    <IndexRoute component={Home} />
  </Route>
);
```


Link from React-router

Then use <Link to="route-name">Link Name</Link>


Should we introduce history?????

You can use history to give you access to the back button and keep track of where you are navigating to and from even if you are creating a SPA.

`pushState` - back button

`replaceState` - overrides and disables back

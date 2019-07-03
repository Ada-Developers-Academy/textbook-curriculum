# TREK Design Scaffolding

## Purpose

This scaffolding is intended for students who have struggled with design and open-ended projects. It lays out the requirements for TREK in a much more concrete way. The hope is that this allows students to focus on the learning goals (using with jQuery and axios, working with callbacks, general JS proficiency) without getting stuck in the design phase.

In particular, it nods toward the MVC lesson from a previous unit in that each thing the user can do is a function.

This document is intended to be student-facing - if you have a student you think would benefit from this, send them a link!

#### What it includes

- One function stub for each user action (`loadTrips`, `showTripDetails`, `reserveTrip`)
- Basic status and error reporting (students will likely need to expand this)
- A minimal `$(document).ready`
- Minimal HTML to make the included JavaScript work

#### What it does not include

- Opinions about how `showTripDetails` knows what trip was clicked
  - Students could either attach it to the HTML (simpler) or use a closure (preferred)
- Helper methods to keep code organized
- `<script>` tags for jQuery and axios
- Semantic HTML
- Styling

Students should feel free to modify any code as they see fit, including changing function signatures, adding new functions, reordering things, changing the HTML, etc. 

### HTML

```html
<section id="status"></section>
<button id="load-trips">Load Trips</button>
<section id="trip-list"></section>
<section id="trip-details"></section>
```

### JavaScript

```js
const displayStatus = (message) => {
  $('#status').html(message);
}

const handleApiError = (error) => {
  console.log(error);
  // TODO: politely report this error to the user
}

const loadTrips = () => {
  displayStatus("loading trips...");

  // TODO: Wave 1
  // make an axios call to the trips index and display the results
}

const showTripDetails = (trip) => {
  console.log("showing details for trip", trip);

  // TODO: Wave 2
  // display trip details and the trip reservation form
}

const reserveTrip = (trip) => {
  console.log("reserving trip", trip)

  // TODO: Wave 2
  // reserve a spot on the trip when the form is submitted
}

$(document).ready(() => {
  $('#load-trips').click(loadTrips);
});
```
# React Components Worksheet

## Part 1

1. Create an **Avatar** component which takes an image URL and presents that image in a circular shape, with any CSS adjustments you would like (e.g. a ring/border around the photo, or a color filter or gradient).
1. Create a **Badge** component which takes a number and displays that number in a colored circle or lozenge shape. If the number is less than 10, the background of the badge should be red, if it’s between 10 and 49 it should be yellow, and if 50+ it should be green.
1. Create a **LineMeter** component, which takes a percentage (a floating point number between 0.0 and 1.0, with 1.0 meaning 100%) and displays an “empty” horizontal bar of a fixed width, and on top of that an additional “filled” horizontal bar the length of which is based on the percentage.
1. Create a **Product** component, which takes a name, a product photo URL, a standard price, and a discount price. If the discounted price is less than the standard price then the component should display the discounted price with some visual indicator (e.g. the price text is red).

## Part 2

1. Create a **UserCard** component which takes a user object. The user object has properties for:
    - User name
    - Avatar image URL
    - Rank - A role or title in the community represented by text e.g. Super Moderator
    - Score

    This component renders a rectangular “card” for the given user. The card itself has the name of the user and their rank, plus it includes an Avatar component (from above) for displaying their avatar image, and a Badge component for displaying their score.
1. Create a **ProductList** component which takes an array of product objects. Each product object has properties for:
    - Product name
    - Product image URL
    - Price
    - Discount price

    This component renders a list of individual Product components (from above). The list display is up to you (e.g. with a single product per row, or multiple products per row).

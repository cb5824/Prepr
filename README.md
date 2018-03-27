# Prepr

Prepr is a web application for those who spend a lot of time making meal plans on a weekly basis. Search and save recipes submitted by others or submit your own. Add ingredients for a recipe to a shopping list with a single click. With repeat use, lists will become organized by the aisle in which an item is located in your local grocery store.

## Getting Started

Clone the repository and install gems with:

```
bundle install
```

Create the database:
```
rake db:create
```

Migrate changes:
```
rake db:migrate
```

If examples are desired, seed the database:
```
rake db:seed
```

Make sure tests pass:
```
rake
```

## Using The App

To fully utilize all features, create an account and log in. Set you home store via the search tool on the "My account" page.

Now you are ready to make a list! Clicking on the "current list" tab will produce a dropdown with your currently saved list items. You may add items manually from this dropdown or click the button on a specific recipe page that reads "Add ingredients to list" to quickly add everything needed for the recipe.

When you have done your shopping make sure to click the "update aisles" button to save the location of any item that does not already have a location in the database. This way future lists will automatically populate the location as well as sort the list by aaisle.

## Acknowledgments
Thank you to the faculty at Launch Academy for guiding me on my coding journey

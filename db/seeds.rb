# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


beef_taco = FactoryBot.create(:recipe, name: "All American Beef Taco", servings: 2, duration: 15, image: 'http://food.fnr.sndimg.com/content/dam/images/food/fullset/2012/2/29/0/0149359_Making-Taco_s4x3.jpg.rend.hgtvcom.616.462.suffix/1371603491866.jpeg', directions: "Make a taco mold by rolling out aluminum foil and folding it over in 10-inch increments until you have a 4-sheet-thick piece of foil. Fold the large foil square in half horizontally, bringing the bottom to the top, and then turn 90 degrees. Crimp over the top and bottom edges by 1 inch, and then fold over the sides by 1 inch. Place the aluminum foil roll or a narrow rolling pin into the center of the foil square and bring the sides together to create a hollow, narrow tube to mold the taco, making sure it can stand up on the long side.

Heat the oven to 250 degrees F.

Heat the peanut oil in a 12-inch cast iron skillet over medium heat until it reaches 350 degrees F on a deep-fry thermometer, about 5 minutes. Adjust the heat to maintain the temperature.

Shape 1 tortilla around the aluminum foil mold, forming a taco shape. Use tongs to hold up the sides against the mold and put the bottom of the tortilla into the hot oil and fry for 20 seconds. Lay 1 side of the tortilla down in the hot oil and fry for 30 seconds. Flip the tortilla over and fry for an additional 30 seconds. Remove the taco shell to a cooling rack set over a newspaper lined half sheet pan and cool for 30 seconds before removing the mold. Sprinkle the hot tortillas with kosher salt, to taste. Repeat frying procedure with the remaining tortillas. Keep the taco shells warm in the heated oven while preparing the filling.

Drain all but 2 tablespoons of the peanut oil from the skillet and return to medium heat. Once the oil shimmers, add the onion and cook until softened and lightly browned around the edges, about 3 to 4 minutes. Add the ground meat, 1 teaspoon salt, and garlic. Cook until browned, about 3 to 4 minutes, stirring occasionally, to break up the meat. Add Taco Potion and beef broth. Bring to a simmer and cook, uncovered, until sauce is slightly thickened, 2 to 3 minutes.

Assemble each taco with meat mixture, panela, jalapeno slices, lettuce, tomatoes, and cilantro. Serve immediately.")
beef_taco.add_ingredients([['3/4 cup', 'peanut oil'], ['12 (6-inch)', 'yellow corn tortillas'], ['1 medium', 'onion'], ['16 ounces', 'ground sirloin'], ['2 cloves', 'garlic'], ['1 batch', 'Taco Potion'], ['2/3 cup', 'low-sodium beef broth'], ['6 ounces', 'panela cheese'], ['12', 'pickled jalapeno slices'], ['1 cup', 'shredded iceberg lettuce'], ['1 large', 'tomato'], ['1/2 cup', 'fresh cilantro leaves']])

fava_bean_salad = FactoryBot.create(:recipe, name: "Fava Bean and Carrot Salad ", servings: 6, duration: 75, image: 'http://www.seriouseats.com/recipes/images/2016/05/20160503-fava-carrot-ricotta-salad-recipe-1-1500x1125.jpg', directions: "1.
Open up fava bean pods and remove individual beans. Discard pods. Bring a medium pot of salted water to a boil and prepare an ice bath. Add fava beans to pot and cook until crisp-tender, about 1 minute. Transfer fava beans to ice bath and allow to chill for 1 minute. Carefully peel off and discard the outer skin from each bean.

2. Scrub carrots under cold running water. Rinse greens (if using). Using a sharp knife, a vegetable peeler, or a mandoline, very thinly slice carrots on a strong bias. Transfer carrot slices to ice bath and set aside.

3. In a large bowl, whisk together olive oil, lemon juice, and lemon zest. Add fava beans and shallot. Carefully dry carrots and greens (if using) and add to bowl. Toss to combine and season to taste with salt and pepper.

4. Spread ricotta over the bottom of a serving plate and top with dressed vegetables. Serve with toast. Drizzle with more olive oil just before serving, if desired.")
fava_bean_salad.add_ingredients([['1 1/2 pounds (700g)', 'fresh fava bean pods'], ['2 small', 'carrots' ], ['2 tablespoons (30ml)', 'extra-virgin olive oil'], ['1 tablespoon (15ml)', 'juice from 1 lemon'], ['1 small', 'shallot'], ['6 ounces (170g)', 'ricotta cheese'], ['4 slices', 'toast']])

//
//  Recipes.swift
//  CS329E_mainProject
//
//  Created by Laynee Tourne-Morton on 11/4/22.
//

import Foundation
import UIKit
import Firebase
import FirebaseFirestore

var recipe1 = Recipe(creator: "Liquor.com", title: "Tequila Sunrise", ingredients: [], printIngredients: ["2 ounces blanco tequila", "4 ounces orange juice, freshly squeezed", "1/4 ounce grenadine", "Garnish: orange slice", "Garnish: cherry"], plainIngredients: ["tequila", "orange juice", "grenadine", "orange slice", "cherry"], servingSize: "1", cuisine: "Drinks", description: ["The Tequila Sunrise cocktail, with its bright striations of color, evokes a summer sunrise. This classic drink has only three ingredients—tequila, grenadine and orange juice—and is served unmixed to preserve the color of each layer."], dietaryRestriction: Recipe.diet.vegan, dish: Recipe.dishType.drinks, stepList: ["1. Add the tequila and then the orange juice to a chilled highball glass filled with ice.", "2. Top with the grenadine, which will sink to the bottom of the glass, creating a layered effect.", "3. Garnish with an orange slice and a cherry."], time: "5", tags: ["Cocktails"], recipeImage: "https://www.liquor.com/thmb/MJAe2fw6uw2-WoJ0Bo0SxH8GueQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/__opt__aboutcom__coeus__resources__content_migration__liquor__2018__07__20113334__tequila-sunrise-720x720-article-ea5f456d4fa54cde9bf969429bfc01e8.jpg")

var recipe2 = Recipe(creator: "Love and Lemons", title: "Greek Salad", ingredients: [], printIngredients: ["3 tablespoons red wine vinegar", "¼ cup extra-virgin olive oil", "1 garlic clove, minced", "½ teaspoon dried oregano, more for sprinkling", "¼ teaspoon Dijon mustard", "¼ teaspoon sea salt", "Freshly ground black pepper", "1 English cucumber, cut lengthwise, seeded, and sliced ¼-inch thick", "1 green bell pepper, chopped into 1-inch pieces", "2 cups halved cherry tomatoes", "5 ounces feta cheese, cut into ½ inch cubes*", "⅓ cup thinly sliced red onion", "⅓ cup pitted Kalamata olives", "⅓ cup fresh mint leaves"], plainIngredients: ["olive oil", "red wine vinegar", "garlic", "oregano", "dijon mustard", "sea salt", "black pepper", "cucumber", "bell pepper", "cherry tomatoes", "feta cheese", "red onion", "kalamata olives", "mint"], servingSize: "4", cuisine: "Greek", description: ["This easy Greek salad recipe is a flavorful, refreshing summer side dish! If you make it ahead for a gathering, save a few mint leaves to add right before serving."], dietaryRestriction: Recipe.diet.vegan, dish: Recipe.dishType.salad, stepList: ["1. Make the dressing: In a small bowl, whisk together the olive oil, vinegar, garlic, oregano, mustard, salt, and several grinds of pepper.", "2. On a large platter, arrange the cucumber, green pepper, cherry tomatoes, feta cheese, red onions, and olives. Drizzle with the dressing and very gently toss. Sprinkle with a few generous pinches of oregano and top with the mint leaves. Season to taste and serve."], time: "15", tags: ["Healthy", "Quick"], recipeImage: "https://cdn.loveandlemons.com/wp-content/uploads/2019/07/greek-salad-recipe-1080x1080.jpg")

var recipe3 = Recipe(creator: "Averie Cooks", title: "Garlic Butter Chicken", ingredients: [], printIngredients: [" 3 tablespoons olive oil", " 1 1/2 pounds boneless skinless chicken breasts, pounded to an even thickness (4 average-sized breasts)", " 1 to 2 teaspoons 21 Salute Seasoning or poultry seasoning", " 1 teaspoon kosher salt, or to taste", " 1 teaspoon freshly ground black pepper, or to taste", "1/2 cup white wine* or chicken broth, or as necessary", " 3 tablespoons unsalted butter, or more if you want extra sauce", " 1 tablespoon garlic, finely minced; or to taste", " 2 teaspoons fresh parsley, optional for garnishing"], plainIngredients: ["olive oil", "boneless skinless chicken breasts", "poultry seasoning", "kosher salt", "black pepper", "white wine", "chicken broth", "unsalted butter", "garlic", "parsley"], servingSize: "4", cuisine: "", description: ["Tender, juicy chicken bathed in a rich garlic butter sauce with a splash of wine for extra flavor!! This EASY stovetop chicken recipe is ready in 15 minutes and will become a family FAVORITE!!"], dietaryRestriction: Recipe.diet.none, dish: Recipe.dishType.main, stepList: ["1. To a large skillet, add the olive oil, pounded chicken, evenly season with 21 Salute, salt, pepper, and cook over medium-high heat for 5 minutes. Do not touch, move, or disturb the chicken while it is searing. After 5 minutes, flip chicken over. It should have a medium golden color. For thicker/bigger chicken breasts, sear for 6-7 minutes.", "2. Allow chicken to cook on the second side for about 5 minutes, or until done and cooked through. Again, do not disturb the chicken while it's searing.", "3. Remove chicken with a slotted spatula and place it on a plate to rest.", "4. Using caution, deglaze your skillet by adding wine (or broth) and allow the liquid to bubble up and steam violently for a few seconds.", "5. Add the butter and allow it to melt, about 1 minute; stir continuously until melted.", "6. Add the garlic and cook until fragrant, about 1 minutes; stir continuously.", "7. Turn the heat off, add the chicken back into the skillet, flip it around in the garlic butter sauce, and spoon the sauce over the chicken.", "8. Optionally garnish with parsley and serve immediately."], time: "20", tags: ["Under 30 Minutes", "Quick", "Dinner", "High-Protein"], recipeImage: "https://www.averiecooks.com/wp-content/uploads/2021/01/garlicbutterchicken-5-500x500.jpg")

var recipe4 = Recipe(creator: "Love and Lemons", title: "Vegetarian Tacos", ingredients: [], printIngredients: ["1 small Japanese eggplant, chopped into 1-inch pieces", "1 cup chopped summer squash", "1 red bell pepper, chopped into 1-inch pieces", "1 cup cherry tomatoes, sliced", "extra-virgin olive oil, for drizzling", "6 tortillas", "1 cup cooked black beans, drained and rinsed", "1 avocados, diced", "chopped cilantro", "1 serrano pepper, sliced, optional", "crumbled cotija cheese, optional", "sea salt and freshly ground black pepper"], plainIngredients: ["Japanese eggplant", "squash", "bell pepper", "cherry tomatoes", "olive oil", "black beans", "avocados", "cilantro", "serrano pepper", "cotija cheese", "sea salt", "black pepper"], servingSize: "2", cuisine: "", description: ["These easy vegetarian tacos are filled with black beans, roasted vegetables, and a delicious creamy avocado tomatillo sauce. Feel free to use any roasted vegetables you like here. Sweet potatoes, winter squash, poblano peppers, and/or roasted onions would all be great."], dietaryRestriction: Recipe.diet.vegetarian, dish: Recipe.dishType.main, stepList: ["1. Preheat the oven to 400° F and line a baking sheet with parchment paper. Place the chopped eggplant, squash, red pepper and tomatoes onto the baking sheet. Drizzle with olive oil and pinches of salt and pepper and roast until golden brown around the edges 25-30 minutes.", "2. Meanwhile, make the sauce. In a food processor, blend together the tomatillo salsa, pepitas, avocado, spinach, olive oil, lime juice and pinches of salt and pepper, to taste. Chill until ready to use.", "3. Assemble the tacos with the black beans, roasted vegetables, diced avocado, cilantro, serrano, and cotija, if using, and generous scoops of sauce. Serve with extra sauce on the side."], time: "20", tags: ["Spicy", "Healthy", "Quick"], recipeImage: "https://cdn.loveandlemons.com/wp-content/uploads/2015/09/vegetarian-tacos.jpg")

var recipe5 = Recipe(creator: "serious eats", title: "Serious Eats' Halal Cart-Style Chicken and Rice With White Sauce", ingredients: [], printIngredients: ["1 tablespoon chopped fresh oregano", "2 tablespoons fresh lemon juice", "1/2 teaspoon ground coriander seed", "3 garlic cloves, roughly chopped (about 1 1/2 tablespoons)", "1/4 cup light olive oil", "Kosher salt and freshly ground black pepper", "2 pounds boneless, skinless chicken thighs, trimmed of excess fat (6 to 8 thighs)", "1 tablespoon vegetable or canola oil", "2 tablespoons unsalted butter", "1/2 teaspoon turmeric", "1/4 teaspoon ground cumin", "1 1/2 cups long-grain or Basmati rice", "2 1/2 cups chicken broth", "Kosher salt and freshly ground black pepper", "1/2 cup mayonnaise", "1/2 cup Greek yogurt", "1 tablespoon sugar", "2 tablespoons white vinegar", "1 teaspoon lemon juice", "1/4 cup chopped fresh parsley"], plainIngredients: ["oregano", "lemon juice", "coriander seed", "garlic", "olive oil", "kosher salt", "black pepper", "boneless skinless chicken thighs", "vegetable oil", "unsalted butter", "tumeric", "cumin", "basmati rice", "chicken broth", "mayonnaise", "greek yogurt", "sugar", "white vinegar", "parsley"], servingSize: "4", cuisine: "Halal", description: ["The chicken is marinated with herbs, lemon, and spices; the rice golden; the sauce, as white and creamy as ever."], dietaryRestriction: Recipe.diet.halal, dish: Recipe.dishType.main, stepList: ["1. For the chicken: Combine the lemon juice, oregano, coriander, garlic, and olive oil in a blender. Blend until smooth. Season the marinade to taste with kosher salt and black pepper. Place the chicken in a 1-gallon zipper-lock bag and add half of the marinade (reserve the remaining marinade in the refrigerator). Turn the chicken to coat, seal the bag, and marinate the chicken in the refrigerator for at least 1 hour and up to 4 hours, turning occasionally to redistribute the marinade (see Note).", "2. Remove the chicken from the bag and pat it dry with paper towels. Season with kosher salt and pepper, going heavy on the pepper. Heat the oil in a 12-inch heavy-bottomed cast iron or stainless-steel skillet over medium-high heat until it is lightly smoking. Add the chicken pieces and cook without disturbing until they are lightly browned on the first side, about 4 minutes. Using tongs, flip the chicken. Reduce the heat to medium and cook until the chicken is cooked through and the center of each thigh registers 165°F. on an instant-read thermometer, about 6 minutes longer. Transfer the chicken to a cutting board and allow to cool for 5 minutes.", "3. Using a chef’s knife, roughly chop the chicken into 1/2- to 1/4-inch chunks. Transfer to a medium bowl, add the remaining marinade, cover loosely with plastic, and refrigerate while you cook the rice and prepare the sauce.", "4. For the rice: Melt the butter over medium heat in a large Dutch oven. Add the turmeric and cumin and cook until fragrant but not browned, about 1 minute. Add the rice and stir to coat. Cook, stirring frequently, until the rice is lightly toasted, about 4 minutes. Add the chicken broth. Season to taste with salt and pepper. Raise the heat to high and bring to a boil. Cover, reduce to a simmer, and cook for 15 minutes without disturbing. Remove from the heat and allow to rest until the water is completely absorbed and the rice is tender, about 15 minutes.", "5. For the sauce: In a small bowl, combine the mayonnaise, yogurt, sugar, vinegar, lemon juice, parsley, and 2 teaspoons black pepper. Whisk to combine. Season to taste with salt.", "6. To serve: Return the entire contents of the chicken bowl (chicken, marinade, and all juices) to the skillet. Cook over medium-high heat, stirring occasionally, until heated through. To serve, divide the rice, lettuce, tomato, and toasted pita bread evenly among four to six plates. Pile the chicken on top of the rice. Top with the white sauce and hot sauce. Serve immediately, passing extra sauce at the table."], time: "2 hours 15 minutes", tags: ["Halal", "High-Protein", "Dinner"], recipeImage: "https://www.seriouseats.com/thmb/qIrZHAp1gwrwbnJ3uG23pUmagrc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/20210710-halal-chicken-rice-diana-chistruga-seriouseats-1-a6e13a5ffd844e568d421aec70d8bb55.jpg")

var recipe6 = Recipe(creator: "Natasha's Kitchen", title: "Pan Seared Steak with Garlic Butter", ingredients: [], printIngredients: ["2 lbs New York Strip Steaks (2 steaks), or Ribeye or Top Sirloin Steaks (1 lb each steak, 1 1/4” thick)", "1/2 Tbsp vegetable oil, or any high heat cooking oil like canola or extra light olive oil", "1 1/2 tsp sea salt", "1 tsp black pepper, freshly ground", "2 Tbsp unsalted butter", "2 cloves garlic, peeled and quartered", "1 sprig fresh rosemary"], plainIngredients: ["steak", "vegetable oil", "sea salt", "black pepper", "butter", "garlic", "rosemary"], servingSize: "4", cuisine: "", description: ["This Pan-Seared Steak has a garlic rosemary-infused butter that makes it taste steakhouse quality. You’ll be impressed at how easy it is to make the perfect steak – seared and caramelized on the outside, and so juicy inside."], dietaryRestriction: Recipe.diet.none, dish: Recipe.dishType.main, stepList: ["1. Thoroughly pat steak dry with paper towels. Just before cooking, generously season with 1 1/2 tsp salt and 1 tsp black pepper", "2. Heat the cast iron pan until hot then add 1/2 Tbsp oil over medium-high heat, swirling to coat. Once the oil is very hot, add steaks to the skillet. Sear the steaks on the first side for 4 minutes until a brown crust has formed then flip and cook another 3-4 minutes. Using tongs, turn the steak on its sides to render the white fat and sear the edges (1-minute per edge).", "3. Reduce heat to medium and immediately add 2 Tbsp butter, quartered garlic cloves and rosemary to the pan. Spoon the butter sauce over the steak, tilting the pan to get butter on your spoon. Continue spooning the sauce over the steak for a minute or until the steak is about 5-10 degrees from your desired doneness (the temperature will continue to rise another 5-10 degrees while steaks rest).", "4. Transfer steak to a cutting board, loosely cover and rest 10 minutes before slicing into 1/2 strips to serve. Spoon extra butter sauce over sliced steak to serve."], time: "20", tags: ["High-Protein", "Quick", "Keto"], recipeImage: "https://natashaskitchen.com/wp-content/uploads/2020/03/Pan-Seared-Steak-4.jpg")

var recipe7 = Recipe(creator: "Tasty", title: "The Fluffiest Vegan Pancakes", ingredients: [], printIngredients: ["2 tablespoons organic sugar", "1 cup flour", "1 tablespoon baking powder", "½ teaspoon salt", "1 cup non-dairy milk", "1 tablespoon apple cider vinegar", "1 teaspoon vanilla", "maple syrup, to serve"], plainIngredients: ["flour", "sugar", "baking powder", "salt", "non-dairy milk", "apple cider vinegar", "vanilla", "maple syrup"], servingSize: "4", cuisine: "", description: [""], dietaryRestriction: Recipe.diet.vegan, dish: Recipe.dishType.main, stepList: ["1. In a medium bowl, add the flour, sugar, baking powder, and salt, and stir to combine.", "2. In a medium bowl or liquid measuring cup, add almond milk, apple cider vinegar, and vanilla, and stir to combine", "3. Pour the liquid mixture into the dry mixture and whisk until smooth.", "4. Let batter rest for 5 minutes.", "5. Pour about ½ cup (65 grams) of batter onto a nonstick pan or griddle over medium heat.", "6. When the top begins to bubble, flip the pancake and cook until golden.", "7. Serve warm with maple syrup."], time: "20", tags: ["Quick", "Breakfast"], recipeImage: "https://img.buzzfeed.com/thumbnailer-prod-us-east-1/video-api/assets/132842.jpg?resize=1200:*")

var recipe8 = Recipe(creator: "Budget Bytes", title: "Pork Gyoza", ingredients: [], printIngredients: ["4 cups finely shredded or chopped cabbage", "2 Tbsp canola or vegetable oil, divided", "3 green onions ", "2 cloves garlic", "1 Tbsp grated ginger", "1/2 Tbsp soy sauce", "1 tsp sesame oil ", "1/2 lb. ground pork", "50 gyoza or wonton wrappers "], plainIngredients: ["cabbage", "vegetable oil", "green onions", "garlic", "ginger", "soy sauce", "sesame oil", "ground pork", "wonton wrappers"], servingSize: "5", cuisine: "Chinese", description: ["Filling, folding, frying, and steaming your own Pork Gyoza at home is not only fun, but it costs just pennies on the dollar compared to restaurants."], dietaryRestriction: Recipe.diet.none, dish: Recipe.dishType.main, stepList: ["1. Sauté the cabbage with 1 Tbsp canola or vegetable oil in a large skillet over medium heat until wilted to half its volume. Transfer the cabbage to a large bowl.", "2. Slice the green onions, mince the garlic, and grate or chop the ginger. Add the onions, garlic, ginger, soy sauce, sesame oil, and ground pork to the bowl with the sautéed cabbage. Massage the mixture with your hands until it is evenly mixed and slightly sticky or tacky in texture.", "3. Spoon about one teaspoon of the pork mixture into the center of a wrapper. Dip a finger in water and wet the outer rim of the wrapper. Fold the wrapper over the filling and pinch the edges to close (here is a video demonstrating different folding styles).", "4. When ready to cook the gyoza, heat 1 Tbsp canola or vegetable oil in a non-stick skillet over medium heat. Working in batches, add the gyoza with the seam side up, and fry until the bottom is golden brown and crispy. Using the lid as a shield, pour about 1/4 to 1/3 cup water into the skillet and quickly place the lid on top to contain the steam and splatter. Let the gyoza steam in the skillet for 1-2 minutes, or until most of the liquid has boiled away. Remove the lid and let the gyoza cook for a minute more, or until the bottom is crispy again. Serve hot."], time: "1 hour", tags: [""], recipeImage: "https://www.budgetbytes.com/wp-content/uploads/2016/02/Pork-Gyoza-Lineup-tall.jpg")

var recipe9 = Recipe(creator: "The Spruce Eats", title: "Apple Cider", ingredients: [], printIngredients: ["10 eating apples, washed and dried", "1 large orange, peeled and broken into sections", "2 cinnamon sticks", "6 whole cloves", "1 teaspoon freshly grated nutmeg", "Other spices, as desired", "Agave nectar, optional, to taste"], plainIngredients: ["apples", "orange", "cinnamon", "cloves", "nutmeg", "agave nectar"], servingSize: "4", cuisine: "", description: ["How fabulous is it to have a drink that cool and refreshes in the summer, but in the autumn, can become warm and comforting? Apple cider is that drink, and the good news is not only is the recipe one of the easiest ever, but it also takes very little time to prepare."], dietaryRestriction: Recipe.diet.vegan, dish: Recipe.dishType.drinks, stepList: ["1. Gather the ingredients.", "2. Chop the apples into large chunks, core pips, peel and all. Put them into the slow cooker and cover with cold water. ", "3. Put the spices into a small square of muslin or cheesecloth, tie with string pop the spice bag into the cooker and attach the string to the handle. ", "4. Bring the water to a boil and once reached, turn the cooker down to low and cook for 6 hours. The cider is ready when the apples are falling apart. Turn the cooker off. Taste and sweeten with the agave if the juice isn't to your taste (you can also use honey or brown sugar if you prefer).", "5. Remove the bag of herbs. Using a fork or a potato masher, press the apples to release any held juices from the pulp. ", "6. Line a fine sieve with cheesecloth and strain the apples and juice into a large container or jug. Serve warm with added slices of lemon and apples for decoration. Or, chill down for a cold drink. "], time: "6 hours", tags: ["Fall Drinks", "Non-Alcoholic"], recipeImage: "https://www.thespruceeats.com/thmb/bYXQzzLU_HboBzmpiKt085haPUc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/AppleCiderDrinkSpruce-5b3cb4ff46e0fb0037f88630.jpg")

var recipe10 = Recipe(creator: "The Wanderlust Kitchen", title: "Indian Red Lentil Dal", ingredients: [], printIngredients: ["3 cups room temperature water", "1 cup red lentils - rinsed", "1 tablespoon vegetable oil", "1/2 teaspoon cumin seeds", "1 2-inch cinnamon stick", "1 cup diced yellow onion", "1 green chili pepper - stemmed, seeded, and minced (serrano for spicy, jalapeno for more mild)", "4 garlic cloves - minced", "1 tablespoon finely minced ginger root", "1/2 teaspoon ground turmeric", "1/2 teaspoon ground cardamom", "1/2 teaspoon paprika", "3/4 teaspoon kosher salt", "1 medium tomato - diced", "1/2 lemon - juice of", "Chopped cilantro leaves for garnish"], plainIngredients: ["red lentils", "vegetable oil", "cumin seeds", "cinnamon", "yellow onion", "green chili pepper", "cloves", "ginger root", "tumeric", "cardamom", "paprika", "kosher salt", "tomato", "lemon", "cilantro"], servingSize: "4", cuisine: "Indian"    , description: ["This Red Lentil Dal recipe makes the perfect plant-based Indian meal! Rich, fragrant, and packed with protein for a meal you can feel good about."], dietaryRestriction: Recipe.diet.vegan, dish: Recipe.dishType.main, stepList: ["1. Place the rinsed lentils in a large saucepan along with room temperature water. Turn the heat to medium and allow the lentils to cook for 20 minutes. You can cook them covered or uncovered, just make sure that you turn down the heat if needed to keep them at a gentle simmer.", "2. Meanwhile, heat the oil in a medium skillet set over medium heat. Add the cumin seeds and cinnamon stick; cook for 60 to 90 seconds, until fragrant.", "3. Add the onion, green chili pepper, garlic, and ginger; cook for 4 to 5 minutes, until the onions are turning translucent.", "4. Add the turmeric, cardamom, paprika, salt, and tomato to the pan. Cook until the tomato begins to fall apart, about 2 to 3 minutes. Discard the cinnamon stick.", "5. Once the lentils are cooked, drain off any excess water that is on top of the lentils, but do not drain off all the water. Stir the spiced onion mixture into the pot of lentils. Add the lemon juice and stir well. Taste and add salt as needed. If it is too dry, then add some water. If it is too wet, then cook on low until it thickens to your liking.", "6. Garnish with cilantro; serve with basmati rice and naan."], time: "30", tags: ["Quick", "Dinner"], recipeImage: "https://www.thecuriouschickpea.com/wp-content/uploads/2019/04/masoor-tadka-dal-3.jpg")

var recipe11 = Recipe(creator: "Onolicious Hawai'i", title: "Hawaiian Lau Lau", ingredients: [], printIngredients: ["12 luau leaves", "1 pound ti leaves", "1 pound pork butt, cubed into 1/2-inch pieces", "1/2 pound black cod, cubed into 1/2-inch pieces", "1/2 pound purple Okinawan sweet potato, peeled and cubed (optional)", "1/2 pound carrots, cubed (optional)", "Hawaiian sea salt"], plainIngredients: ["lau lau leaves", "ti leaves", "pork butt", "sweet potato", "carrots", "sea salt"], servingSize: "2", cuisine: "Onolicious Hawai'i", description: ["Lau lau is a Hawaiian dish made of pork and butterfish wrapped in lu’au leaves and ti leaves. Lau lau is steamed and eaten with rice and poi. It’s a real treat!"], dietaryRestriction: Recipe.diet.none, dish: Recipe.dishType.main, stepList: ["1. First, prep the two types of leaves. LUAU LEAVES: take the luau leaves and wash them thoroughly one by one. Chop off the bottom stem that extends past the bottom of the leaf. Chop that stem into 1/2-inch pieces and set aside. TI LEAVES: wash the ti leaves and pat dry. Remove the main/thickest vein that runs through the center of the ti leaf. Removing this vein allows the ti leave to be more pliable/easy to fold as you will be using it to wrap the fillings. Set aside. ", "2. At a clean workstation, stack 3-5 luau leaves on the counter. Arrange them so that the biggest leaf is on the bottom and the smallest leaf is on top. ", "3. In the center of the leaf, put in a few chunks of the pork butt and butterfish. Add 2-3 pieces each cubed carrots and purple Okinawan sweet potato, if using. Add several of the chopped luau leaf stems. Sprinkle over Hawaiian sea salt. ", "4. In the center of the leaf, put in a few chunks of the pork butt and butterfish. Add 2-3 pieces each cubed carrots and purple Okinawan sweet potato, if using. Add several of the chopped luau leaf stems. Sprinkle over Hawaiian sea salt. ", "5. Next, wrap the ti leaves around the luau leaf bundle. Use the ti leaf ends to tie a topknot. If the ends are too short, use a string to tie/secure the bundle.", "6. Put the wrapped lau lau in a steamer. Steam for three to four hours till nice and tender. Remove the ti leaf (you can't eat the ti leaf), and serve! Ideally with rice and/or poi, chili pepper water and all your favorite Hawaiian side dishes like lomi lomi salmon and chicken long rice. Don't forget the kulolo for dessert ^_^"], time: "4 hours", tags: ["Dinner"], recipeImage: "https://onolicioushawaii.com/wp-content/uploads/2019/07/Lau-Lau-6-Yamas-Fish-Market.jpg.webp")

var recipe12 = Recipe(creator: "Cookie and Kate", title: "Homemade Vegetarian Chili", ingredients: [], printIngredients: ["2 tablespoons extra-virgin olive oil", "1 medium red onion, chopped", "1 large red bell pepper, chopped", "2 medium carrots, chopped", "2 ribs celery, chopped", "½ teaspoon salt, divided", "4 cloves garlic, pressed or minced", "2 tablespoons chili powder*", "2 teaspoons ground cumin", "1 ½ teaspoons smoked paprika*", "1 teaspoon dried oregano", "1 large can (28 ounces) or 2 small cans (15 ounces each) diced tomatoes**, with their juices", "2 cans (15 ounces each) black beans, rinsed and drained", "1 can (15 ounces) pinto beans, rinsed and drained", "2 cups vegetable broth or water", "1 bay leaf", "2 tablespoons chopped fresh cilantro, plus more for garnishing", "1 to 2 teaspoons sherry vinegar or red wine vinegar or lime juice, to taste", "Garnishes: chopped cilantro, sliced avocado, tortilla chips, sour cream or crème fraîche, grated cheddar cheese, etc."], plainIngredients: ["olive oil", "red onion", "bell pepper", "carrot", "celery", "salt", "garlic", "chili powder", "cumin", "paprika", "oregano", "diced tomatoes", "black beans", "pinto beans", "vegetable broth", "bay leaf", "cilantro", "red wine vinegar"], servingSize: "4", cuisine: "", description: ["This chili is perfect for watching football games with a crowd, since it’s a hearty meatless option that carnivores will enjoy. Plus, it can be vegan and gluten free if you choose your toppings carefully. This chili will satisfy everyone."], dietaryRestriction: Recipe.diet.none, dish: Recipe.dishType.main, stepList: ["1. In a large Dutch oven or heavy-bottomed pot over medium heat, warm the olive oil until shimmering. Add the chopped onion, bell pepper, carrot, celery and ¼ teaspoon of the salt. Stir to combine and cook, stirring occasionally, until the vegetables are tender and the onion is translucent, about 7 to 10 minutes.", "2. Add the garlic, chili powder, cumin, smoked paprika and oregano. Cook until fragrant while stirring constantly, about 1 minute.", "3. Add the diced tomatoes and their juices, the drained black beans and pinto beans, vegetable broth and bay leaf. Stir to combine and let the mixture come to a simmer. Continue cooking, stirring occasionally and reducing heat as necessary to maintain a gentle simmer, for 30 minutes.", "4. Remove the chili from the heat and discard the bay leaf. For the best texture and flavor, transfer 1 ½ cups of the chili to a blender, making sure to get some of the liquid portion. Securely fasten the lid and blend until smooth (watch out for hot steam), then pour the blended mixture back into the pot. (Or, you can blend the chili briefly with an immersion blender, or mash the chili with a potato masher until it reaches a thicker, more chili-like consistency.)", "5. Add the chopped cilantro, stir to combine, and then mix in the vinegar, to taste. Add salt to taste, too—I added ¼ teaspoon more at this point. Divide the mixture into individual bowls and serve with garnishes of your choice. This chili will keep well in the refrigerator for about 4 days or you can freeze it for longer-term storage."], time: "1 hour", tags: ["Dinner", "Fall Favorites", "Gameday Winners"], recipeImage: "https://cookieandkate.com/images/2015/11/vegetarian-chili-recipe-6.jpg")

var recipe13 = Recipe(creator: "allrecipes", title: "Best Chocolate Chip Cookies", ingredients: [], printIngredients: ["1 cup butter, softened", "1 cup white sugar", "1 cup packed brown sugar", "2 eggs", "2 teaspoons vanilla extract", "1 teaspoon baking soda", "2 teaspoons hot water", "½ teaspoon salt", "3 cups all-purpose flour", "2 cups semisweet chocolate chips", "1 cup chopped walnuts"], plainIngredients: ["butter", "cane sugar", "brown sugar", "eggs", "baking soda", "salt", "flour", "chocolate chips", "walnuts"], servingSize: "48", cuisine: "Baking", description: ["This chocolate chip cookie recipe is truly the best. Just take it from the 14,000 members of the Allrecipes community who have given it rave reviews! These chocolate chip cookies are beloved because they're soft, chewy, and absolutely irresistible. Our top-rated recipe for chocolate chip cookies will quickly become your go-to."], dietaryRestriction: Recipe.diet.none, dish: Recipe.dishType.main, stepList: ["1. Preheat the oven to 350 degrees F (175 degrees C).", "2. Beat butter, white sugar, and brown sugar with an electric mixer in a large bowl until smooth. Beat in eggs, one at a time, then stir in vanilla. Dissolve baking soda in hot water. Add to batter along with salt. Stir in flour, chocolate chips, and walnuts.", "3. Drop spoonfuls of dough 2 inches apart onto ungreased baking sheets.", "4. Bake in the preheated oven until edges are nicely browned, about 10 minutes. Cool on the baking sheets briefly before removing to a wire rack to cool completely."], time: "30 minutes", tags: ["Cookies"], recipeImage: "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fpublic-assets.meredithcorp.io%2Fb7b49bf8ed6a3fa0f490d2852a25f78e%2F1667952107588IMG_20221108_195848.jpg&q=60&c=sc&orient=true&poi=auto&h=512")

var recipe14 = Recipe(creator: "Rainbow Plant Life", title: "Vegan Apple Cinnamon Bundt Cake", ingredients: [], printIngredients: ["1/2 cup (55-60g) loosely packed organic brown sugar", "1/2 cup (75-80g) finely chopped walnuts", "4 teaspoons ground cinnamon", "1 teaspoon ground cloves", "Heaping 1/2 teaspoon freshly grated nutmeg*", "Heaping 1/2 teaspoon freshly grated nutmeg*", "1 tablespoon baking powder", "1 teaspoon baking soda", "1/2 teaspoon salt", "1 1/4 cups (300 mL) plant-based milk of choice (I used full-fat oat milk)", "1 stick (112g) Country Crock Plant Butter, melted", "1/2 cup (120 mL) neutral-flavored oil (I used sunflower oil)", "1 1/4 cups (250g) organic cane sugar", "3/4 cup (180 mL) no-sugar added apple juice", "3/4 cup (180g) unsweetened applesauce", "2 teaspoons pure vanilla extract", "1 1/4 cups (150g) organic powdered sugar", "2-3 tablespoons plant-based milk of choice", "2 tablespoons freshly squeezed orange juice (can sub lemon juice for a slightly tart icing)"], plainIngredients: ["brown sugar", "walnuts", "cinnamon", "cloves", "nutmeg", "flour", "baking powder", "baking soda", "salt", "plant-based milk", "plant butter", "sunflower oil", "cane sugar", "apple juice", "applesauce", "vanilla extract"], servingSize: "16", cuisine: "", description: ["This Vegan Apple Cinnamon Bundt Cake is soft and moist yet light and airy – the best of both worlds! With warm cinnamon apple flavors, it’s a perfect easy yet impressive cake for the fall baking season!"], dietaryRestriction: Recipe.diet.vegan, dish: Recipe.dishType.dessert, stepList: ["1. Preheat the oven to 350°F/175°C. Grease a 10-cup bundt cake pan** with oil (or vegan butter or cooking spray) including in the crevices, then sprinkle a little flour in the pan. Tilt the pan to distribute the flour evenly, then flip the pan over and tap out any excess flour.", "2. In a small bowl, combine the brown sugar, walnuts, cinnamon, cloves, and nutmeg. Mix well.", "3. In a large bowl, sift together the flour, baking powder, baking soda, and salt. Add in the spiced brown sugar-walnut mixture and stir together to mix well.", "4. Make a well in the center of the flour mixture and then add the plant-based milk, melted vegan butter, oil, cane sugar, apple juice, applesauce, and vanilla.", "5. Using an electric mixer on slow speed, combine the dry and wet ingredients until you have a smooth, thick batter, but stop mixing as soon as the batter comes together – do not overmix. Overmixing can cause the batter to become tough.", "6. Pour the cake batter into the greased bundt pan and smooth the surface with a spatula. If any bubbles have developed in the batter, tap the pan gently on the counter.", "7. Bake the cake in the preheated oven for 60-65 minutes, or until the cake is firm and springs back when touched. Mine took exactly 60 minutes, but all ovens are different.", "8. Transfer the cake to a cooling rack for 15-20 minutes. Then, run a paring knife around the edges to loosen it up, tap the cake and shake it gently to help loosen it, and then carefully invert the cake onto the cooling rack.", "9. To make the Orange Icing: Pour the powdered sugar into a medium bowl. Gradually add the almond milk and orange juice and beat with a whisk until you achieve your desired consistency. Add more liquid for a thinner glaze. Drizzle icing on top of bundt cake. Store leftovers in an airtight container at room temperature for 2-3 days, or in the fridge for 4-5 days."], time: "2 hours", tags: ["Vegan Dessert", "Fall Favorites"], recipeImage: "https://rainbowplantlife.com/wp-content/uploads/2020/11/Applebundtcake-closeup2281of129.jpg")

var recipe15 = Recipe(creator: "Meaningful Eats", title: "Easy Gluten-Free Lasagna", ingredients: [], printIngredients: ["1 16oz bag of shredded mozzarella cheese low-moisture", "8 oz ricotta cheese", "8 oz cottage cheese small curd", "1/2 cup grated parmesan cheese", "2 eggs", "1 teaspoon dried parsley", "1/2 teaspoon pepper", "1 lb ground beef", "1/2 white onion finely diced", "29 oz can Hunt's Tomato Sauce or another canned tomato sauce", "24-28 oz bottle jarred tomato basil pasta sauce I like the Tomato Basil sauce from Trader Joe's best", "10 oz Gluten-Free Oven Ready Lasagna Noodles I use Barilla"], plainIngredients: ["ricotta cheese", "mozzarella cheese", "cottage cheese", "eggs", "parsley", "black pepper", "ground beef", "white onion", "tomato sauce", "pasta sauce", "gluten-free lasagna noodles"], servingSize: "12", cuisine: "Italian", description: ["An EASY recipe for gluten-free lasagna using barilla gluten free lasagna noodles!"], dietaryRestriction: Recipe.diet.gluten_free, dish: Recipe.dishType.main, stepList: ["1. Preheat the oven to 425F.", "2. Set aside one cup of the mozzarella cheese for topping the lasagna later. In a medium bowl, mix together the remaining mozzarella and rest of the cheese mixture ingredients until combined.", "3. In a large skillet over medium-high heat, add the ground beef and onion. Brown the ground beef, breaking into very small chunks as you do. (The smaller the better so there aren't big chunks of meat in the lasagna.)", "4. Drain the meat of any excess grease and return to the pan. Add the sauces and mix until heated through.", "5. Spoon a thin layer of sauce onto the bottom of a 9×13 baking dish. Using 5 noodles for the first layer – dip a noodle in the sauce and spread the top of the noodle with a layer of sauce. Place in the pan. Dipping/covering each individual noodle with sauce ensures the noodles will cook through. (See the photos in the post.) Repeat with the remaining noodles. You may have to break the 5th noodle in half to fit it along the bottom of the pan. If it breaks no problem, just layer it in the best you can!", "6. Layer the rest of the lasagna as follows: Add 1/2 of the cheese mixture in dollops across the top of the noodle/sauce layer. Spread with a small spatula until smooth. Spread a few small spoonfuls of sauce over the cheese layer. Dip/cover another 5 noodles and lay them on top of the cheese mixture. Add the other 1/2 of the cheese mixture in dollops across the top of the noodle/sauce layer. Spread with a small spatula until smooth. Spread a few small spoonfuls of sauce over the cheese layer. Dip/cover the remaining 6 noodles in sauce and and lay them on top. Spread any remaining sauce over top of the lasagna.", "7. Cover the dish tightly with aluminum foil. Bake for 40 minutes covered. Remove the foil and top with the reserved mozzarella cheese. Bake for another 15-20 minutes until browned and bubbling.", "8.Let the lasagna sit for 20 minutes before serving. Slice and enjoy!"], time: "1 hour 45 minutes", tags: [], recipeImage: "https://meaningfuleats.com/wp-content/uploads/2021/02/gluten-free-lasagna-3.jpg")

var recipe16 = Recipe(creator: "The Big Man's World", title: "Hunan Beef", ingredients: [], printIngredients: ["1 tbsp oil vegetable, safflower, or peanut oil", "1 lb flank steak sliced into 1/4 inch strips", "1 large onion chopped", "2 cloves garlic minced", "1 head broccoli chopped into even sized florets", "1 large bell pepper chopped", "1 tablespoon sesame oil", "1/2 cup beef broth", "3 tablespoons soy sauce", "1 tablespoon fish sauce", "1 tablespoon white vinegar", "2 tablespoons brown sugar substitute", "2 tablespoons chili paste", "1/2 teaspoon xanthan gum"], plainIngredients: ["vegetable oil", "steak", "onion", "garlic", "broccoli", "bell pepper", "sesame oil", "beef broth", "soy sauce", "fish sauce", "white vinegar", "brown sugar", "chili paste", "xanthan gum"], servingSize: "4", cuisine: "Chinese", description: ["This Hunan beef is an easy and delicious stir fry made with tender steak strips, crisp vegetables, all in an authentic Hunan sauce. No thickeners or sugar-laden sauces needed, it’s keto friendly but full of flavor!"], dietaryRestriction: Recipe.diet.none, dish: Recipe.dishType.main, stepList: ["1. In a small bowl, add all the Hunan sauce ingredients and whisk together until combined. Set aside.", "2. In a non-stick pan, add the oil and place it over medium heat. Once hot, add the beef strips and cook for 4-5 minutes until no longer pink. Remove the beef from the pan and place it back over medium heat. Add the vegetables and cook for 2-3 minutes, until tender.", "3. Add the beef back into the pan then pour the Hunan sauce over it. Cook the stir fry for 4-5 minutes, until the sauce has thickened.", "4. Remove the pan from the heat and serve immediately."], time: "12 minutes", tags: ["Quick", "Dinner"], recipeImage: "https://thebigmansworld.com/wp-content/uploads/2021/10/hunan-beef-6.jpg")


var recipes = [recipe1, recipe2, recipe3, recipe4, recipe5, recipe6, recipe7, recipe8, recipe9, recipe10, recipe11, recipe12, recipe13, recipe14, recipe15, recipe16]

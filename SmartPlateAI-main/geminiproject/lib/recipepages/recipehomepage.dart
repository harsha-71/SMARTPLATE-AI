import 'package:flutter/material.dart';
import 'package:geminiproject/bmi/homescreen.dart';
import 'package:geminiproject/demorecipegemini/home.dart';
import 'package:geminiproject/feedback/feedback_page.dart';

import 'package:geminiproject/recipepages/firstrecipe.dart';

class Recipe {
  final String title;
  final String imageUrl;
  final String description;
  final List<String> ingredients;
  final String instructions;

  Recipe({
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.ingredients,
    required this.instructions,
  });
}
List<String> recipeImages = [
  'lib/images/recipe1.png',
  'lib/images/recipe2.png',
  'lib/images/recipe3.png',
  'lib/images/recipe4.png',
  'lib/images/recipe5.png',
  'lib/images/recipe10.jpg',
  'lib/images/recipe6.jpg',
  'lib/images/recipe7.jpg',
  'lib/images/recipe8.jpg',
  'lib/images/recipe9.jpg',
];

class recipes extends StatefulWidget {
  const recipes({super.key});

  @override
  State<recipes> createState() => _recipesState();
}

class _recipesState extends State<recipes> {




  final List<Recipe> recipes = [

    Recipe(
      title: 'Gulab Jamun',
      imageUrl: 'lib/images/recipe1.png', // Adjust the path as per your project structure
      description: 'Gulab Jamun is a popular Indian dessert consisting of soft, deep-fried balls made of milk solids, soaked in sweet syrup.',
      ingredients: [
        '1 cup milk powder',
        '1/4 cup all-purpose flour (maida)',
        '1/4 tsp baking soda',
        '2 tbsp ghee',
        'Milk, as needed for kneading the dough',
        'Oil or ghee, for frying',
      ],
      instructions: '1. Mix milk powder, all-purpose flour, baking soda, and ghee in a bowl.\n\n'
          '2. Gradually add milk and knead to form a soft dough.\n\n'
          '3. Divide the dough into small balls and fry in hot oil or ghee until golden brown.\n\n'
          '4. Prepare sugar syrup by boiling sugar and water until it reaches a sticky consistency.\n\n'
          '5. Soak the fried jamuns in the sugar syrup for a few hours before serving.',
    ),




    Recipe(
      title: 'Recipe 2',
      imageUrl: 'lib/images/recipe2.png',
      description: 'This is the description for Recipe 2.',
      ingredients: ['Ingredient A', 'Ingredient B', 'Ingredient C'],
      instructions: 'Follow these instructions to cook Recipe 2.',
    ),
    Recipe(
      title: 'Recipe 2',
      imageUrl: 'lib/images/recipe3.png',
      description: 'This is the description for Recipe 2.',
      ingredients: ['Ingredient A', 'Ingredient B', 'Ingredient C'],
      instructions: 'Follow these instructions to cook Recipe 2.',
    ),
    Recipe(
      title: 'Recipe 2',
      imageUrl: 'lib/images/recipe4.png',
      description: 'This is the description for Recipe 2.',
      ingredients: ['Ingredient A', 'Ingredient B', 'Ingredient C'],
      instructions: 'Follow these instructions to cook Recipe 2.',
    ),
    Recipe(
      title: 'Recipe 2',
      imageUrl: 'lib/images/recipe5.png',
      description: 'This is the description for Recipe 2.',
      ingredients: ['Ingredient A', 'Ingredient B', 'Ingredient C'],
      instructions: 'Follow these instructions to cook Recipe 2.',
    ),
    Recipe(
      title: 'recipe 6 ',
      imageUrl: 'lib/images/recipe6.jpg',
      description: 'This is the description for Recipe 2.',
      ingredients: ['Ingredient A', 'Ingredient B', 'Ingredient C'],
      instructions: 'Follow these instructions to cook Recipe 2.',
    ),
    Recipe(
      title: 'Recipe 2',
      imageUrl: 'lib/images/recipe7.jpg',
      description: 'This is the description for Recipe 2.',
      ingredients: ['Ingredient A', 'Ingredient B', 'Ingredient C'],
      instructions: 'Follow these instructions to cook Recipe 2.',
    ),
    Recipe(
      title: 'Recipe 2',
      imageUrl: 'lib/images/recipe8.jpg',
      description: 'This is the description for Recipe 2.',
      ingredients: ['Ingredient A', 'Ingredient B', 'Ingredient C'],
      instructions: 'Follow these instructions to cook Recipe 2.',
    ),
    Recipe(
      title: 'Recipe 2',
      imageUrl: 'lib/images/recipe9.jpg',
      description: 'This is the description for Recipe 2.',
      ingredients: ['Ingredient A', 'Ingredient B', 'Ingredient C'],
      instructions: 'Follow these instructions to cook Recipe 2.',
    ),
    Recipe(
      title: 'Recipe 2',
      imageUrl: 'lib/images/recipe10.jpg',
      description: 'This is the description for Recipe 2.',
      ingredients: ['Ingredient A', 'Ingredient B', 'Ingredient C'],
      instructions: 'Follow these instructions to cook Recipe 2.',
    ),
    // Add more recipes as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar:
      AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu, color: Colors.white), // Food icon
            SizedBox(width: 8),
            Text(
              'Popular Recipes',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green[700], // Customizing app bar color
        elevation: 0, // No shadow

      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(

                image: DecorationImage(image: AssetImage(

                  "lib/images/img_2.png",


                ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text(
                'SmartplateAI',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),


            ListTile(
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePager()), // Replace BodyTrackPage with the actual name of your body track page
                );
                // Navigate to default home screen
                // Example: Get.toNamed('/home');
              },
            ),

            ListTile(
              title: Text("View receipe"),
              onTap: () {
                Navigator.pop(context); // Close the drawer

                // Navigate to default home screen
                // Example: Get.toNamed('/home');
              },
            ),
            ListTile(
              title: Text('Body Track'),
              onTap: () {
                // Navigate to body track page
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()), // Replace BodyTrackPage with the actual name of your body track page
                );
              },
            ),
            ListTile(
              title: Text('Feedback'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => feedback_form()), // Replace BodyTrackPage with the actual name of your body track page
                );
                // Handle feedback action
              },
            ),
            ListTile(
              title: Text('Account'),
              onTap: () {
                // Handle account action
              },
            ),
          ],
        ),
      ),


      body:GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 images per row
          mainAxisSpacing: 16.0, // spacing between rows
          crossAxisSpacing: 19.0, // spacing between columns
          childAspectRatio: 0.90, // aspect ratio (width / height) of each item
        ),
        itemCount: recipeImages.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetailPage(recipes[index]), // Passing index + 1 as page number
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.amberAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(

                    recipes[index].imageUrl, // Use Image.asset if images are bundled with the app
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

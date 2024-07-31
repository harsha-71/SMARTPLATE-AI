import 'package:flutter/material.dart';
import 'package:geminiproject/bmi/homescreen.dart';
import 'package:geminiproject/demorecipegemini/gemini_api.dart';
import 'package:geminiproject/feedback/feedback_page.dart';
import 'package:geminiproject/recipepages/recipehomepage.dart';
import 'package:get/get.dart';

class HomePager extends StatefulWidget {
 // final String name;

//const HomePager({Key? key, required this.name}) : super(key: key);

  @override
  State<HomePager> createState() => _HomePageState();
}

class _HomePageState extends State<HomePager> {


  final textController = TextEditingController();
  List<String> ingredients = [];
  String recipe = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, // Set the color of the drawer icon
          ),
          backgroundColor: Colors.black,
          title: Text('SmartplateAI',style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white),),

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => recipes()), // Replace BodyTrackPage with the actual name of your body track page
                  );
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







        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  keyboardType: TextInputType.text,
                  controller: textController,
                  decoration: InputDecoration(
                    hintText: 'Enter ingredient',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          ingredients.add(textController.text);
                          textController.clear();
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Displaying added ingredients
                Wrap(
                  children: ingredients.map((ingredient) {
                    return Chip(
                      label: Text(ingredient),
                      onDeleted: () {
                        setState(() {
                          ingredients.remove(ingredient);
                        });
                      },
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    String recipeData =
                    await GeminiAPI.getGeminiData(ingredients);
                    setState(() {
                      recipe = recipeData;
                    });
                  },
                  child: Text(
                    'Generate Recipe',
                    style: TextStyle(color: Colors.black),
                  ),
                ),


                SizedBox(height: 20),
                // Display recipe generated by Gemini API
                Text(
                  recipe,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),


      ),
    );
  }
}

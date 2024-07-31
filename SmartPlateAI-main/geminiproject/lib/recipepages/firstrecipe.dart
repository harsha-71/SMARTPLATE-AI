import 'package:flutter/material.dart';
import 'recipehomepage.dart';

class RecipeDetailPage extends StatelessWidget {
  final Recipe recipe;

  RecipeDetailPage(this.recipe);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Image.asset(
            recipe.imageUrl,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16.0),
          Text(
            recipe.description,
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 16.0),
          Text(
            'Ingredients:',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: recipe.ingredients
                .map((ingredient) => Text('- $ingredient'))
                .toList(),
          ),
          SizedBox(height: 16.0),
          Text(
            'Instructions:',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          Text(
            recipe.instructions,
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}

// lib/views/recipe_list_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/controllers/recipe_controller.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/views/recipe_details_screen.dart';

class RecipeListScreen extends StatelessWidget {
  const RecipeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller =
        RecipeController(Provider.of<RecipeModel>(context, listen: false));
    var recipes = Provider.of<RecipeModel>(context).recipes;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe App'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (query) {
              controller.filterRecipes(query);
            }, 
            decoration: const InputDecoration(
              labelText: 'Search Recipes',
              contentPadding: EdgeInsets.all(15),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(recipes[index].name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetailScreen(index: index),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// lib/views/recipe_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/models/recipe_model.dart';

class RecipeDetailScreen extends StatelessWidget {
  final int index;

  const RecipeDetailScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var recipe = Provider.of<RecipeModel>(context).recipes[index];

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ingredients:'),
            for (var ingredient in recipe.ingredients) Text('- $ingredient'),
            const SizedBox(height: 16),
            const Text('Instructions:'),
            for (var instruction in recipe.instructions) Text('- $instruction'),
          ],
        ),
      ),
    );
  }
}

// lib/models/recipe_model.dart

import 'package:flutter/material.dart';

class Recipe {
  final String name;
  final List<String> ingredients;
  final List<String> instructions;

  Recipe({
    required this.name,
    required this.ingredients,
    required this.instructions,
  });
}

class RecipeModel extends ChangeNotifier {
  final List<Recipe> _allRecipes = [
    Recipe(
      name: 'Spaghetti Bolognese',
      ingredients: [
        'Spaghetti',
        'Ground beef',
        'Tomato sauce',
        'Onions',
        'Garlic'
      ],
      instructions: [
        'Cook spaghetti',
        'Brown beef with onions and garlic',
        'Add tomato sauce'
      ],
    ),
    // Add more recipes as needed
  ];

  List<Recipe> _filteredRecipes = [];

  RecipeModel() {
    _filteredRecipes = _allRecipes;
  }

  List<Recipe> get recipes => _filteredRecipes;

  void filterRecipes(String query) {
    _filteredRecipes = _allRecipes
        .where(
            (recipe) => recipe.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }
}

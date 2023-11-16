// lib/controllers/recipe_controller.dart

import 'package:recipe_app/models/recipe_model.dart';

class RecipeController {
  final RecipeModel _model;

  RecipeController(this._model);

  void filterRecipes(String query) {
    _model.filterRecipes(query);
  }
}

import 'package:flutter/material.dart';
import 'package:makananku/components/recipe_item.dart';

import '../data/recipe_dummy.dart';

/// Page for showing the recipes of each category
class CategoryMealsScreen extends StatelessWidget {
  // RouteName to be accesible from the outside to prevent error
  static const ROUTE_NAME = '/category-meals';

  // Passing the title via constructor is one way to communicate between screens
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen({this.categoryId, this.categoryTitle});
  
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;

    final title = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryRecipes = DUMMY_RECIPES.where((recipe) => recipe.categories.contains(categoryId)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return RecipeItem(categoryRecipes[index]);
        },
        itemCount: categoryRecipes.length,
      ),
    );
  }
}
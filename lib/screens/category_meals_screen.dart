import 'package:flutter/material.dart';

/// Page for showing the recipes of each category
class CategoryMealsScreen extends StatelessWidget {
  // Passing the title via constructor is one way to communicate between screens
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen({this.categoryId, this.categoryTitle});
  
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;

    final title = routeArgs['title'];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('The Recipes for this category!'),),
    );
  }
}
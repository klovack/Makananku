import 'package:flutter/material.dart';

class RecipeFilter {
  bool isGlutenFree;
  bool isLactoseFree;
  bool isVegan;
  bool isVegetarian;

  RecipeFilter({
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
  });
}
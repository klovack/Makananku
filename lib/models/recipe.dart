import 'package:flutter/material.dart';

class Recipe {
  final String id;
  final List<String> categories;
  final String name;
  final String imageURL;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final ERecipeComplexity complexity;
  final ERecipeAffordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Recipe({
    @required this.id,
    @required this.categories,
    @required this.name,
    this.imageURL,
    this.ingredients,
    this.steps,
    this.duration,
    this.complexity,
    this.affordability,
    this.isGlutenFree,
    this.isLactoseFree,
    this.isVegan,
    this.isVegetarian,
  });

  static String toStringERecipeComplexity(ERecipeComplexity complexity) {
    switch (complexity) {
      case ERecipeComplexity.CHALLENGING:
        return 'Challenging';
      case ERecipeComplexity.SIMPLE:
        return 'Simple';
      case ERecipeComplexity.HARD:
        return 'Hard';
      case ERecipeComplexity.IMPOSSIBLE:
        return 'Impossible';
      default:
        return '';
    }
  }

  static String toStringERecipeAffordability(ERecipeAffordability affordability) {
    switch (affordability) {
      case ERecipeAffordability.CHEAP:
        return '¢';
      case ERecipeAffordability.REASONABLE:
        return '¢¢';
      case ERecipeAffordability.AFFORDABLE:
        return '\$';
      case ERecipeAffordability.PRICEY:
        return '\$\$';
      case ERecipeAffordability.EXPENSIVE:
        return '\$\$\$';
      case ERecipeAffordability.LUXURIOUS:
        return '\$\$\$\$';
      default:
        return '';
    }
  }
}

enum ERecipeComplexity { SIMPLE, CHALLENGING, HARD, IMPOSSIBLE }

enum ERecipeAffordability {
  CHEAP,
  REASONABLE,
  AFFORDABLE,
  PRICEY,
  EXPENSIVE,
  LUXURIOUS
}

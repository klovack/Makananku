import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:makananku/models/recipe.dart';

class FavoritesScreen extends StatelessWidget {

  final List<Recipe> favoriteRecipes;

  FavoritesScreen(this.favoriteRecipes);
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Kosong nih!\nTambahkan makanan kesukaanmu kesini',
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

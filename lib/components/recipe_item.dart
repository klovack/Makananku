import 'package:flutter/material.dart';

import '../components/thumbnail.dart';
import '../screens/recipe_detail_screen.dart';
import '../models/recipe.dart';

class RecipeItem extends StatelessWidget {
  final Recipe recipe;
  final Function onRemoveItem;

  RecipeItem(this.recipe,{this.onRemoveItem});

  void _selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      RecipeDetailScreen.ROUTE_NAME,
      arguments: this.recipe.id,
    ).then((val) {
      if (val != null && val == this.recipe.id) {
        if (this.onRemoveItem != null) {
          this.onRemoveItem(val);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.grey),
        ),
        elevation: 10,
        margin: EdgeInsets.all(24),
        child: Column(
          children: <Widget>[
            Thumbnail(
              imageURL: recipe.imageURL,
              title: recipe.name,
            ),

            // First Row
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // Duration
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 10,
                      ),
                      Text('${recipe.duration} min')
                    ],
                  ),

                  Row(
                    children: <Widget>[
                      Icon(Icons.insert_chart),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                          '${Recipe.toStringERecipeComplexity(recipe.complexity)}')
                    ],
                  ),

                  // Affordability
                  Row(
                    children: <Widget>[
                      Text('Price: '),
                      Text(
                        '${Recipe.toStringERecipeAffordability(recipe.affordability)}',
                        style: TextStyle(
                            fontFamily: 'Roboto Condensed',
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'see details',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

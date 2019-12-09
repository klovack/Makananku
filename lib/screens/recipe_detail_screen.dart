import 'package:flutter/material.dart';
import 'package:makananku/components/ingredients_checkbox.dart';

import 'package:makananku/data/recipe_dummy.dart';

class RecipeDetailScreen extends StatelessWidget {
  static const ROUTE_NAME = "/recipe";

  @override
  Widget build(BuildContext context) {
    final recipeId = ModalRoute.of(context).settings.arguments as String;
    final selectedRecipe =
        DUMMY_RECIPES.firstWhere((recipe) => recipe.id == recipeId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedRecipe.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Image Thumbnail
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedRecipe.imageURL,
                fit: BoxFit.cover,
              ),
            ),

            // Title
            _buildTitleContainer(context, 'Ingredients'),

            // Ingredients
            _buildListCardWrapper(
              context,
              child: ListView.builder(
                itemCount: selectedRecipe.ingredients.length,
                itemBuilder: (ctx, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(2),
                      child: IngredientCheckbox(
                          selectedRecipe.ingredients[index], false),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),

            // Steps
            _buildTitleContainer(context, 'Steps'),

            _buildListCardWrapper(
              context,
              child: ListView.builder(
                itemCount: selectedRecipe.steps.length,
                itemBuilder: (ctx, index) => Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(selectedRecipe.steps[index]),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 20,
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),

        onPressed: () {
          Navigator.of(context).pop(recipeId);
        },
      ),
      
    );
  }

  Container _buildListCardWrapper(BuildContext context,
      {@required Widget child}) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: child,
        ),
      ),
    );
  }

  Container _buildTitleContainer(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
}

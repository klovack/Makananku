import 'package:flutter/material.dart';
import 'package:makananku/components/recipe_item.dart';
import 'package:makananku/models/recipe.dart';

/// Page for showing the recipes of each category
class CategoryMealsScreen extends StatefulWidget {
  // RouteName to be accesible from the outside to prevent error
  static const ROUTE_NAME = '/category-meals';

  final List<Recipe> availableRecipes;

  CategoryMealsScreen(this.availableRecipes);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String title;
  List<Recipe> categoryRecipes;
  bool _firstLoaded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_firstLoaded) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;

      title = routeArgs['title'];
      final categoryId = routeArgs['id'];
      categoryRecipes = widget.availableRecipes
          .where((recipe) => recipe.categories.contains(categoryId))
          .toList();

      _firstLoaded = true;
    }
  }

  void _removeRecipe(String recipeId) {
    setState(() {
      categoryRecipes.removeWhere((recipe) => recipe.id == recipeId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return RecipeItem(
            categoryRecipes[index],
            onRemoveItem: this._removeRecipe,
          );
        },
        itemCount: categoryRecipes.length,
      ),
    );
  }
}

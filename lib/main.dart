import 'package:flutter/material.dart';
import 'package:makananku/screens/bottom_tabs_screen.dart';
import 'package:makananku/screens/filters_screen.dart';

import './screens/tabs_screen.dart';
import './screens/recipe_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Makananku',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.tealAccent,
        canvasColor: Colors.grey.shade200,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          title: TextStyle(
            fontSize: 20,
            fontFamily: 'Roboto Condensed',
            fontWeight: FontWeight.bold,
          )
        )
      ),

      // Top Tabs
      // Uncomment/comment to see changes
      // home: TabsScreen(),

      // Bottom Tabs
      // Uncomment/comment to see changes
      home: BottomTabsScreen(),
      
      // Routes
      routes: {
        CategoryMealsScreen.ROUTE_NAME: (ctx) => CategoryMealsScreen(),
        RecipeDetailScreen.ROUTE_NAME: (ctx) => RecipeDetailScreen(),
        FiltersScreen.ROUTE_NAME: (ctx) => FiltersScreen(),
      },

      // On Generate route handles unknown route
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen(
      //     title: "Hello",
      //   ));
      // },

      // onUnknownRoute handles page such 404 page does
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen(title: "Unknown Route",));
      },
    );
  }
}
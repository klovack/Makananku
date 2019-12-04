import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart';
import '../util/raised_shadow.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({this.id, this.title, this.color});

  void _selectCategory(BuildContext context) {
    // Push the page by creating the page route
    // Navigator.of(context).push(MaterialPageRoute(
    //   builder: (ctx) {
    //     return CategoryMealsScreen(
    //       categoryId: id,
    //       categoryTitle: title,
    //     );
    //   },
    // ));

    // Push the page by name
    Navigator.of(context)..pushNamed(CategoryMealsScreen.ROUTE_NAME,
      arguments: {
        'id': id,
        'title': title,
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(15),
        // insert image here
        child: Stack(
          overflow: Overflow.clip,
          children: <Widget>[
            Text(
              title,
              style: Theme.of(context).textTheme.title,
            ),
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              color.withOpacity(.5),
              color.withOpacity(.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Color.alphaBlend(color, Colors.black).withOpacity(.5),
            width: 1,
          ),
          boxShadow: RaisedShadow.defaultShadow(),
        ),
      ),
    );
  }
}

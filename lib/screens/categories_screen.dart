import 'package:flutter/material.dart';

import '../components/category_item.dart';
import '../data/category_dummy.dart';

class CategoriesScreen extends StatelessWidget {
  final String title;
  
  CategoriesScreen({this.title});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        children: dummyCategories.map((catData) {
          return CategoryItem(
            color: catData.color,
            title: catData.title,
            id: catData.id,
          );
        }).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 20,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
        ),
      ),
    );
  }
}
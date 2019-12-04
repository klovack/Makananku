import 'package:flutter/material.dart';

class Category {
  static int _totalCategoryCount = 0;

  final String id;
  final String title;
  final Color color;

  const Category({
    @required this.id,
    @required this.title,
    this.color = Colors.red,
  });
}
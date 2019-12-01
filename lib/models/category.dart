import 'package:flutter/material.dart';

class Category {
  static int totalNum = 0;

  final String id;
  final String title;
  final Color color;

  Category({
    @required this.title,
    this.color = Colors.red,
  }): this.id = 'makananku-category-$totalNum';
}
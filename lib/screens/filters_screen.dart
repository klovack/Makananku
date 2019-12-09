import 'package:flutter/material.dart';
import 'package:makananku/components/nav_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const String  ROUTE_NAME = '/filter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
      ),
      drawer: NavDrawer(),
      body: Center(
        child: Text('Hello Filter'),
      ),
    );
  }
}
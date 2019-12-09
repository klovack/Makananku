import 'package:flutter/material.dart';
import 'package:makananku/components/nav_drawer.dart';

import 'package:makananku/screens/categories_screen.dart';
import 'package:makananku/screens/favorites_screen.dart';

class BottomTabsScreen extends StatefulWidget {
  @override
  _BottomTabsScreenState createState() => _BottomTabsScreenState();
}

class _BottomTabsScreenState extends State<BottomTabsScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'page': CategoriesScreen(title: 'Makananku'),
      'title': 'Makananku',
    },
    {
      'page': FavoritesScreen(),
      'title': 'Kesukaanmu',
    }
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      this._selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: NavDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white38,
        selectedItemColor: Colors.white70,
        currentIndex: _selectedPageIndex,
        elevation: 5,
        // type: BottomNavigationBarType.shifting,
        items: [
          // Categories
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),

          // Favorites
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}

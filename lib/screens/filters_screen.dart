import 'package:flutter/material.dart';
import 'package:makananku/components/nav_drawer.dart';
import 'package:makananku/models/recipeFilter.dart';

class FiltersScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/filter';

  final Function(RecipeFilter) onFilterSave;
  final RecipeFilter currentFilter;

  FiltersScreen({@required this.currentFilter, @required this.onFilterSave});

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  RecipeFilter _filter = RecipeFilter(
    isVegetarian: false,
    isVegan: false,
    isLactoseFree: false,
    isGlutenFree: false,
  );

  @override
  void initState() {
    _filter = widget.currentFilter;
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filter'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                widget.onFilterSave(this._filter);
              },
            )
          ],
        ),
        drawer: NavDrawer(),
        body: Column(
          children: <Widget>[
            // Title
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Sesuaikan pilihan makanan anda',
                style: Theme.of(context).textTheme.title,
              ),
            ),

            Expanded(
              child: ListView(
                children: <Widget>[
                  // Switch GlutenFree
                  _buildSwitchListTile(
                    title: 'Gluten Free',
                    subtitle: 'Tampilkan makanan yang bebas dari zat perekat',
                    value: _filter.isGlutenFree,
                    onChanged: _onChangeGluttenFree,
                  ),

                  // Switch Vegetarian
                  _buildSwitchListTile(
                    title: 'Vegetarian',
                    subtitle: 'Tampilkan makanan yang ramah bagi vegetarian',
                    value: _filter.isVegetarian,
                    onChanged: (bool val) {
                      setState(() {
                        this._filter.isVegetarian = val;
                      });
                    },
                  ),

                  // Switch vegan
                  _buildSwitchListTile(
                    title: 'Vegan',
                    subtitle: 'Tampilkan makanan yang cocok untuk Vegan',
                    value: _filter.isVegan,
                    onChanged: (bool val) {
                      setState(() {
                        this._filter.isVegan = val;
                      });
                    },
                  ),

                  // Switch vegan
                  _buildSwitchListTile(
                    title: 'Bebas Laktosa',
                    subtitle: 'Tampilkan makanan yang bebas Laktosa',
                    value: _filter.isLactoseFree,
                    onChanged: (bool val) {
                      setState(() {
                        this._filter.isLactoseFree = val;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }

  SwitchListTile _buildSwitchListTile(
      {@required String title,
      @required String subtitle,
      @required bool value,
      @required Function onChanged}) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }

  void _onChangeGluttenFree(bool val) {
    setState(() {
      this._filter.isGlutenFree = val;
    });
  }
}

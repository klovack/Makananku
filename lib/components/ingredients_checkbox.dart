import 'package:flutter/material.dart';

class IngredientCheckbox extends StatefulWidget {
  final String name;

  final bool isChecked;

  IngredientCheckbox(this.name, this.isChecked);

  @override
  _IngredientCheckboxState createState() => _IngredientCheckboxState(isChecked);
}

class _IngredientCheckboxState extends State<IngredientCheckbox> {
  bool isChecked;
  
  _IngredientCheckboxState(this.isChecked);
  
  void _onCheckedIngredient(bool value) {
    setState(() {
      isChecked = value;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      onChanged: _onCheckedIngredient,
      value: isChecked,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(widget.name),
    );
  }
}

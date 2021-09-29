
import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map <String , bool> currentFilters;
  FilterScreen(this.currentFilters , this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  @override initState(){
     _glutenFree = widget.currentFilters['gluten'];
     _lactoseFree = widget.currentFilters['lactose'];
     _vegan = widget.currentFilters['vegen'];
     _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }
  Widget bulidSwitchListtile(String title, String description, bool currentValue,
      Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Fillters"),actions: [
        IconButton(
            icon:Icon(Icons.save),
            onPressed: (){
              final Map<String,bool> selectedFilters={
              'gluten':_glutenFree,
              'lactose':_lactoseFree,
              'vegan':_vegan,
              'vegetarian':_vegetarian,
              };
              widget.saveFilters(selectedFilters);
              },
        ),
      ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "adjust your meal selection",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                bulidSwitchListtile(
                  'Gluten-free',
                  'only include gluten-free meals',
                  _glutenFree,
                      (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                bulidSwitchListtile(
                  'Actose-free',
                  'only include actose-free meals',
                  _lactoseFree,
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                bulidSwitchListtile(
                  'Vegetarian',
                  'only include vegetarian meals',
                  _vegetarian,
                      (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                bulidSwitchListtile(
                  'vegan',
                  'only include vegan meals',
                  _vegan,
                      (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}

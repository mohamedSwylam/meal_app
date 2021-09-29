
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/screens/category_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

import 'favorite_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String, Object>> _pages = [{
    'page': CategoryScreen(),
    'title': 'Categories',
  },
    {
      'page': FavoriteScreen(),
      'title': 'Your Favorite',
    },
  ];
  int _selectPageIndex = 0;

  void _selectPage(int value) {
    setState(() {
      _selectPageIndex = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectPageIndex]['title']),),
      body: _pages[_selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        selectedItemColor: Theme
            .of(context)
            .accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("Favorite"),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/screens/category_meals_screens.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tab_screen.dart';

import 'models/meal.dart';

void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

  Map<String,bool>_filters={
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,
  };
  List<Meal>_availableMeal=DUMMY_MEALS;

  void _setFilters( Map<String,bool> _filtersData){
    setState(() {
      _filters=_filtersData;
      _availableMeal=DUMMY_MEALS.where((meal) {
        if(_filters['gluten'] && !meal.isGlutenFree){
          return false;
        }
        if(_filters['lactose'] && !meal.isLactoseFree){
          return false;
        }
        if(_filters['vegen'] && !meal.isVegan){
          return false;
        }
        if(_filters['vegetarian'] && !meal.isVegetarian){
          return false;
        }
        return true;
      }).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255,254,229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20,50,50, 1),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20,50,50, 1),
            ),
            title: TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed'
            ),
          )
      ),
      title: 'Flutter Demo',
      //home: MyHomePage(),
      routes: {
        '/':(context)=>TabScreen(),
        CategoryMealsScreen.routeName:(context)=>CategoryMealsScreen(_availableMeal),
        MealDetailScreen.routeName:(context)=>MealDetailScreen(),
        FilterScreen.routeName:(context)=>FilterScreen(_filters,_setFilters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text("Meal App"),
      ),
      body: null,
    );
  }
}

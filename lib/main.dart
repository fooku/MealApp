import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tebs_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meal_screen.dart';
import 'package:flutter/services.dart';

import 'dummy_data.dart';
import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      title: 'DeliMeals',
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Color.fromRGBO(223, 222, 183, 1),
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          accentColor: Colors.redAccent,
          fontFamily: 'Montserrat',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                  fontSize: 18,
                  fontFamily: "Montserrat",
                  color: Color.fromRGBO(20, 51, 51, 1),
                  fontWeight: FontWeight.bold))),
      initialRoute: '/',
      routes: {
        '/': (cxt) => TabsScreen(),
        CategoryMealScreen.rounteName: (cxt) =>
            CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName: (cxt) => MealDetailScreen(),
        FiltersScreen.routeName: (cxt) => FiltersScreen(_filters, _setFilters),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        // if (settings.name == '/meal-detail') {
        //   return ...;
        // } else if (settings.name == '/something-else') {
        //   return ...;
        // }
        // return MaterialPageRoute(builder: (ctx) => CategoriesScreen(),);
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}

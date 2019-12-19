import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tebs_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meal_screen.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
                  color: Colors.white,
                  fontWeight: FontWeight.bold))),
      initialRoute: '/',
      routes: {
        '/': (cxt) => TabsScreen(),
        CategoryMealScreen.rounteName: (cxt) => CategoryMealScreen(),
        MealDetailScreen.routeName: (cxt) => MealDetailScreen(),
        FiltersScreen.routeName: (cxt) => FiltersScreen(),
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

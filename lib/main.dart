import 'package:flutter/material.dart';
import 'package:meals_app/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primaryColor: Color.fromRGBO(223, 222, 183, 1),
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Montserrat',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Colors.white),
              body2: TextStyle(color: Colors.black),
              title: TextStyle(
                  fontSize: 18,
                  fontFamily: "Montserrat",
                  color: Colors.white,
                  fontWeight: FontWeight.bold))),
      home: CategoriesScreen(),
    );
  }
}

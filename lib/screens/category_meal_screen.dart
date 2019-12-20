import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealScreen extends StatefulWidget {
  static const rounteName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealScreen(
    this.availableMeals,
  );

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    // ...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          final meal = displayedMeals[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            imageUrl: meal.imageUrl,
            duration: meal.duration,
            complexity: meal.complexity,
            affordability: meal.affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}

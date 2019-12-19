import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = 'meal-detail';

  Widget buildTitle(String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: TextStyle(fontSize: 26),
      ),
    );
  }

  Widget buildContainer(BuildContext ctx, Widget child) {
    return Container(
      height: 150,
      width: 300,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Theme.of(ctx).primaryColor,
          border: Border.all(color: Colors.grey)),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        appBar: AppBar(
          title: Text(selectedMeal.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildTitle('Ingredients'),
              buildContainer(
                  context,
                  ListView.builder(
                    itemBuilder: (ctx, index) => Card(
                      // color: Colors.purpleAccent,
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Text(selectedMeal.ingredients[index])),
                    ),
                    itemCount: selectedMeal.ingredients.length,
                  )),
              buildTitle('Step'),
              buildContainer(
                  context,
                  ListView.builder(
                    itemBuilder: (ctx, index) => Column(children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('${(index + 1)}'),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      Divider()
                    ]),
                    itemCount: selectedMeal.steps.length,
                  )),
            ],
          ),
        ));
  }
}

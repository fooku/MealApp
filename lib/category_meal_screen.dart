import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("The Resipes"),
      ),
      body: Center(
        child: Text(
          'The Recipes For The Category!',
          style: Theme.of(context).textTheme.body2,
        ),
      ),
    );
  }
}

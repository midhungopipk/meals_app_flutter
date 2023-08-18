import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:meals_app/models/meal.dart';

class MeaalDetailsScreen extends StatelessWidget {
  const MeaalDetailsScreen({
    super.key,
    required this.mealItem,
  });
  final Meal mealItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mealItem.title),
      ),
      body: Column(
        children: [
          Image.network(
            mealItem.imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 300,
          ),
          SizedBox(height: 14),
          Text(
            'Ingredients',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          )
        ],
      ),
    );
  }
}

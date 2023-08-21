import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToggleFavourite});

  final void Function(Meal meal) onToggleFavourite;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    // Navigator.push(context, route)
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
          onToggleFavourite: onToggleFavourite),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: availableCategories.length,
      itemBuilder: (ctx, index) => CategoryGridItem(
        category: availableCategories[index],
        onSelectCategory: () =>
            _selectCategory(context, availableCategories[index]),
      ),
    );
  }
}

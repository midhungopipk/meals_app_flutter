import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details_screen.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    required this.onToggleFavourite,
  });

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavourite;

  void selectedMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MeaalDetailsScreen(
              mealItem: meal,
              onToggleFavourite: onToggleFavourite,
            )));
  }

  static const routeName = '/mealsScreen';
  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'No meals here!',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Try selecting another category!',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: meals[index],
          onSelectMeal: (meal) {
            selectedMeal(context, meal);
          },
        ),
      );
    }

    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(title),
    //   ),
    //   body: meals.isEmpty
    //       ? Center(
    //           child: Column(
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               Text(
    //                 'No meals here!',
    //                 style: Theme.of(context).textTheme.headlineLarge!.copyWith(
    //                     color: Theme.of(context).colorScheme.onBackground),
    //               ),
    //               const SizedBox(
    //                 height: 16,
    //               ),
    //               Text(
    //                 'Try selecting another category!',
    //                 style: Theme.of(context).textTheme.bodyLarge!.copyWith(
    //                     color: Theme.of(context).colorScheme.onBackground),
    //               ),
    //             ],
    //           ),
    //         )
    //       : ListView.builder(
    //           itemCount: meals.length,
    //           itemBuilder: (ctx, index) => MealItem(
    //             meal: meals[index],
    //             onSelectMeal: (meal) {
    //               selectedMeal(context, meal);
    //             },
    //           ),
    //         ),
    // );
  }
}

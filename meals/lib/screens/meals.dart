import 'package:flutter/material.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/mealItem.dart';

import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals});

  final String? title;
  final List<Meal> meals;


  void selectMeal(Meal meal, BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => MealDetailsScreen(meal: meal)));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemBuilder: (context, index) => Text(meals[index].title));

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(" oh no.... nothing here!!",
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .onBackground)),
            SizedBox(
              height: 16,
            ),
            Text(
              "Try selecting a different category",
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme
                  .of(context)
                  .colorScheme
                  .onBackground),
            )
          ],
        ),
      );
    }
    if (meals.isNotEmpty) {
      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (context, index) =>
              MealItem(meal: meals[index], onSelectMeal: (meal,context) {
                selectMeal(meal, context);
              },));
    }

    if(title != null){
      return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content,
      );
    }
    return content;


  }
}

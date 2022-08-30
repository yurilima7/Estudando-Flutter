import 'package:flutter/material.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/utils/app_routes.dart';
 
void main() => runApp(const MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue)
          .copyWith(secondary: Colors.amber
        ),

        fontFamily: 'Raleway',
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),

        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 20,
          ),
        ),

      ),

      routes: {
        AppRoutes.home:(context) => const CategoriesScreen(),
        AppRoutes.categoriesMeals:(context) => const CategoriesMealsScreen(),
        AppRoutes.mealDetail:(context) => const MealDetailScreen(),
      },
    );
  }
}

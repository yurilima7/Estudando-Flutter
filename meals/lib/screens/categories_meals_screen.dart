import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/widgets/meal_item.dart';

class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // recebe informações da tela anterior
    final category = ModalRoute.of(context)?.settings.arguments as Category;
    // retorna as comidas da categoria requerida
    final categoryMeals = dummyMeals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(

      appBar: AppBar(
        title: Text(category.title),
      ),

      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) {
          return Mealtem(meal: categoryMeals[index]);
        }
      ),
    );
  }
}

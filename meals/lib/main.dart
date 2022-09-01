import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/utils/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //variável que guarda as configurações feitas
  Settings settings = Settings();

  late List<Meal> _availableMeals = dummyMeals;
  // filtra a exibição conforme configuração
  void _filterMeals(Settings settings) {
    setState(() {
      // atualizando a variável que guarda as configurações
      this.settings = settings;
      // recebendo o filtro de exibição
      _availableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegetarian &&
            !filterVegan;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
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
        AppRoutes.home: (context) => const TabsScreen(),
        AppRoutes.categoriesMeals: (context) =>
            CategoriesMealsScreen(_availableMeals),
        AppRoutes.mealDetail: (context) => const MealDetailScreen(),
        AppRoutes.settings: (context) => SettingsScreen(_filterMeals, settings),
      },
    );
  }
}

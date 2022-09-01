import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favorite_screen.dart';
import 'package:meals/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals, {Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int _selectedScreenIndex = 0;
  late List<Map<String, Object>> _screens;

  @override
  void initState(){
    super.initState();

    _screens = [
      {'title': 'Lista de Categorias', 'screen': const CategoriesScreen()},
      {'title': 'Meus Favoritos', 'screen': FavoriteScreen(widget.favoriteMeals)},
    ];
  }

  _selectScreen(int index){
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['title'] as String),

      ),

      drawer: const MainDrawer(),

      body: _screens[_selectedScreenIndex]['screen'] as Widget,

      bottomNavigationBar: BottomNavigationBar(

        onTap: _selectScreen,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white, // quando não selecionado
        selectedItemColor: Theme.of(context).colorScheme.secondary, // selecionado
        currentIndex: _selectedScreenIndex, // selecionado atualmente
        
        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categorias",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favoritos",
          ),
        ]
      ),
    );
  }
}

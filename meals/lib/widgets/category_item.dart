import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/utils/app_routes.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({Key? key, required this.category}) : super(key: key);
  // função que passa para próxima tela
  void _selectCategory(BuildContext context){ 
    Navigator.of(context).pushNamed(AppRoutes.categoriesMeals, arguments: category,);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor, // cor ao clicar
      borderRadius: BorderRadius.circular(15),

      child: Container(
    
        padding: const EdgeInsets.all(15), // distanciamento
    
        decoration: BoxDecoration(
    
          borderRadius: BorderRadius.circular(15),
          // coloração
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color,
            ],
    
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        // texto a ser exibido
        child: Text(category.title, style: Theme.of(context).textTheme.headline6),
      ),
    );
  }
}

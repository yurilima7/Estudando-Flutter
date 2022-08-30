import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class Mealtem extends StatelessWidget {
  final Meal meal;

  const Mealtem({Key? key, required this.meal}) : super(key: key);

  void _selectMeal(){

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: _selectMeal,

      child: Card(
        // bordas do card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
    
        elevation: 4,
        margin: const EdgeInsets.all(10),
        
        child: Column(
          children: [
            // coloca um widget por cima do outro
            Stack( 
              children: [
              
                ClipRRect(
                  // adiciona bordas na imagem
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),

                  child: Image.network(
                    meal.imageUrl, 
                    height: 250, 
                    width: double.infinity, 
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

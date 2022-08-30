import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/utils/app_routes.dart';

class Mealtem extends StatelessWidget {
  final Meal meal;

  const Mealtem({Key? key, required this.meal}) : super(key: key);
  // navegando para tela de detalhes
  void _selectMeal(BuildContext context){
    Navigator.of(context).pushNamed(AppRoutes.mealDetail, arguments: meal);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: () => _selectMeal(context),

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

                Positioned(

                  bottom: 20, // afasta do fundo do stack
                  right: 10,

                  child: Container(
                    
                    width: 300,
                    color: Colors.black54, // 54% de opacidade
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20
                    ),
                
                    child: Text(
                      meal.title,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                
                      softWrap: true, // quebra de linha se necessário
                      overflow: TextOverflow.fade, // caso imagem muito grande
                    ),
                  ),
                ),
              ],
            ),
            // widget que representa os elementos por categoria
            Padding(
              padding: const EdgeInsets.all(20),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Row(
                    children: [

                      const Icon(Icons.schedule),
                      const SizedBox(width: 6),
                      Text('${meal.duration} min'),
                    ],
                  ),

                  Row(
                    children: [

                      const Icon(Icons.work),
                      const SizedBox(width: 6),
                      Text(meal.complexityText),
                    ],
                  ),

                  Row(
                    children: [

                      const Icon(Icons.attach_money),
                      const SizedBox(width: 6),
                      Text(meal.costText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

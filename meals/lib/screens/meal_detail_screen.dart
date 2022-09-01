import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget _createSectionTitle(BuildContext context, String title){
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),

        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      );
    }

    Widget _createSectionContainer(Widget child){
      return Container(

        width: 330,
        height: 200,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),

        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        
        child: child,
      );
    }

    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title:  Text(meal.title),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // magem do prato
            SizedBox(
              height: 300,
              width: double.infinity,
      
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
      
            _createSectionTitle(context, 'Ingredientes'),
            // exibição dos ingredites
            _createSectionContainer(
              // lista em cards os ingredientes
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: ((context, index) {
                  
                  return Card(
                    color: Theme.of(context).colorScheme.secondary,
      
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(meal.ingredients[index]),
                    ),
                  );
                }),
              ),
            ),
      
            _createSectionTitle(context, 'Passos'),
            // exibição de passos
            _createSectionContainer(
              // listando o passo a passo do preparo
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (context, index){
                  return Column(
                    children: [

                      ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),

                        title: Text(meal.steps[index]),
                      ),

                      const Divider(),
                    ],
                  );
                }
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.star),
        // fecha tela e retorna dados
        onPressed: () => Navigator.of(context).pop(meal.title),
      ),
    );
  }
}

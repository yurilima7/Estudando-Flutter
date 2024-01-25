import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            TextButton(
              onPressed: () {
                // Argumentos: Recupera pelo Modular.args.data
                Modular.to.pushNamed('/categoria', arguments: 'Categoria Selecionada A');
              },

              child: const Text('Categoria module'),
            ),

            const SizedBox(height: 10),

            TextButton(
              onPressed: () {
                // NamedParameters: Recupera pelo Modular.args.params
                Modular.to.pushNamed('/produto/Produto_X/xyz',);
              },

              child: const Text('Produto module'),
            ),

            const SizedBox(height: 10),

            TextButton(
              onPressed: () {
                // QueryParameters: Recupera pelo Modular.args.queryParams
                Modular.to.pushNamed('/produto/xyz?nome=Produto_X',);
              },

              child: const Text('Produto Query Param module'),
            ),
          ],
        ),
      ),
    );
  }
}
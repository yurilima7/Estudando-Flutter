import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/detalhe', arguments: 'Testando');
              },
              child: const Text('Ir para detalhe'),
            ),
            TextButton(
              onPressed: () async {
                var message =
                    await Navigator.of(context).pushNamed('/detalhe2');

                debugPrint('Mensagem recebida foi: $message');
              },
              child: const Text('Ir para detalhe2 e aguardar'),
            ),
          ],
        ),
      ),
    );
  }
}

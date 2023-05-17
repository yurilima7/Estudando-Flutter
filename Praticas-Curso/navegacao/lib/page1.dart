import 'package:flutter/material.dart';
import 'package:navegacao/page2.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    settings: const RouteSettings(
                      name: 'detalhe',
                      arguments: {
                        'id': 10,
                      },
                    ),
                    builder: (context) => const Page2(),
                  ),
                );
              },
              child: const Text('page 2 VIA PAGE'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/page2', arguments: {'id':10});
              },
              child: const Text('page 2 VIA NAMED'),
            ),
          ],
        ),
      ),
    );
  }
}

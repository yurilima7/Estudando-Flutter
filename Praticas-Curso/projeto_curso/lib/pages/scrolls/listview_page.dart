import 'package:flutter/material.dart';

class ListviewPage extends StatelessWidget {
  const ListviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Page'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(
          color: Colors.red,
        ),
        itemCount: 50,
        itemBuilder: (context, index) {
          debugPrint('Carregando o indice: $index');
          return ListTile(
            title: Text('Indice $index'),
            subtitle: const Text('Flutter é vida!'),
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://docs.flutter.dev/assets/images/dash/early-dash-sketches2.jpg'),
            ),
          );
        },
      ),
    );
  }
}

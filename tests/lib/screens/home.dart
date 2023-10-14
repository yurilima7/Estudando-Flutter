import 'package:flutter/material.dart';
import 'package:tests/widgets/drawer_app.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),

      drawer: const DrawerApp(),

      body: const Center (
        child: Text('Navegue para uma página via drawer'),
      ),
    );
  }
}

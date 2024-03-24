import 'package:flutter/material.dart';
import 'package:tests/widgets/drawer_app.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

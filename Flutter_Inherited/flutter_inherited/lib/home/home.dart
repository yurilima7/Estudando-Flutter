import 'package:flutter/material.dart';
import 'package:flutter_inherited/home/drawer_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      drawer: const DrawerPage(),
      body: Container(),
    );
  }
}

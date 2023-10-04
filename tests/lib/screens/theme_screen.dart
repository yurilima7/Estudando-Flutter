import 'package:flutter/material.dart';
import 'package:tests/main.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personalização'),
      ),
      body: Center(
        child: IconButton(
          onPressed: () {
            MainApp.theme.value = MainApp.theme.value == ThemeMode.light
                  ? ThemeMode.dark
                  : ThemeMode.light;
          },
          icon: Icon(
            MainApp.theme.value == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode
            ),
        ),
      ),
    );
  }
}

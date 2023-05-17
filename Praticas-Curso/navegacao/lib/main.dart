import 'package:flutter/material.dart';
import 'package:navegacao/page1.dart';
import 'package:navegacao/page2.dart';
import 'package:navegacao/page3.dart';
import 'package:navegacao/page4.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(_) => const Page1(),
        '/page2':(_) => const Page2(),
        Page2.routeName:(_) => const Page3(),
        '/page4':(_) => const Page4(),
      },
    );
  }
}

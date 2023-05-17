import 'package:flutter/material.dart';
import 'package:navegacao/core/navigator_observer_custom.dart';
import 'package:navegacao/pages/detalhe.dart';
import 'package:navegacao/pages/detalhe2.dart';
import 'package:navegacao/pages/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [NavigatorObserverCustom()],
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            settings: settings,
            builder: (context) => const Home(),
          );
        }
        if (settings.name == '/detalhe') {
          final stringValue = settings.arguments as String?;
          return MaterialPageRoute(
            settings: settings,
            builder: (context) =>
                Detalhe(teste: stringValue ?? 'Não foi enviado'),
          );
        }
        return null;
      },
      routes: {
        '/':(context) => const Home(),
        '/detalhe2':(context) => const Detalhe2(),
      },
    );
  }
}

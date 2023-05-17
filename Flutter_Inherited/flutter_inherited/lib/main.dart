import 'package:flutter/material.dart';
import 'package:flutter_inherited/home/home.dart';
import 'package:flutter_inherited/model/user_model.dart';
import 'package:flutter_inherited/splash/splash.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UserModel(
      name: 'Lima',
      imgAvatar: 'https://pbs.twimg.com/media/Evh5xcjUUAIfHRK.jpg',
      birthDate: '27/03/2003',
      child: MaterialApp(
        routes: {
          '/': (_) => const Splash(), 
          '/home': (_) => const Home(), 
        },
      ),
    );
  }
}

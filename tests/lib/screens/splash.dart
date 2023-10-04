import 'dart:async';

import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  Future<void> startTime() async {
    var duration = const Duration(seconds: 5);
    if (mounted) {
      Timer(duration, () {
        if (mounted) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/sliverBar', (route) => false);
        }
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF095A9D),

      body: Center(
        child: Image.asset('assets/images/Teste.png'),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Detalhe extends StatelessWidget {
  final String teste;
  const Detalhe({super.key, required this.teste});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe'),
      ),
      body: Center(
        child: Text('String teste: $teste'),
      ),
    );
  }
}

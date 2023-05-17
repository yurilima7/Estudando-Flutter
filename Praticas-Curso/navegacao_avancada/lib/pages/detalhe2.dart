import 'package:flutter/material.dart';

class Detalhe2 extends StatelessWidget {
  const Detalhe2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe 2'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pop('Olá mundo!!');
          },
          child: const Text('Voltar'),
        ),
      ),
    );
  }
}

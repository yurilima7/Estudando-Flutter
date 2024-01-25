import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Produto2Page extends StatelessWidget {
  final String? nome;

  const Produto2Page({super.key, this.nome});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produto'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Text(Modular.args.queryParams['nome'] ?? 'Nome não enviado'),
            Text(nome ?? 'Nome não enviado'),
          ],
        ),
      ),
    );
  }
}

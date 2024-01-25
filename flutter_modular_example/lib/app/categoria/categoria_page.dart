import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CategoriaPage extends StatefulWidget {
  final String? categoria;

  const CategoriaPage({super.key, this.categoria});
  // CategoriaPage({super.key}) : categoria = Modular.args.data;

  @override
  State<CategoriaPage> createState() => _CategoriaPageState();
}

class _CategoriaPageState extends State<CategoriaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categoria'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(Modular.args.data ?? 'Não foi enviado a categoria'),
            Text(widget.categoria ?? 'Não foi enviado a categoria'),
          ],
        ),
      ),
    );
  }
}

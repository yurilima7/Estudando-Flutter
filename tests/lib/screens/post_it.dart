import 'package:flutter/material.dart';
import 'dart:math';

class PostIt extends StatefulWidget {
  const PostIt({super.key});

  @override
  State<PostIt> createState() => _PostItState();
}

class _PostItState extends State<PostIt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post-it simulator'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: 20,
        itemBuilder: (_, index) => InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Editar texto'),
                  content: const TextField(
                    maxLines: 3,
                    maxLength: 100,
                    decoration: InputDecoration(
                      hintText: 'Insira o texto',
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        // Salvar o texto
                      },
                      child: const Text('Salvar'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Cancelar
                      },
                      child: const Text('Cancelar'),
                    ),
                  ],
                );
              },
            );
          },

          child: Card(
            child: ListTile(
              title: Center(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final maxWidth = constraints.maxWidth;
                    return Text(
                      'Nesciunt tenetur maiores voluptatem maxime. Corrupti cum iosjdioadjnnjaksnksaldkajlak dkqwfhdd ansioansio',
                      style: TextStyle(fontSize: min(14, maxWidth / 11)),
                      // textAlign: TextAlign.justify,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

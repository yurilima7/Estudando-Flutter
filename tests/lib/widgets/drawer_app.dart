import 'package:flutter/material.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Center(
              child: Text('Teste'),
            ),
          ),

          ListTile(
            title: const Text('Galeria'),
            onTap: () => Navigator.of(context).pushNamed('/galeryAccess'),
          ),

          ListTile(
            title: const Text('Sliver bar'),
            onTap: () => Navigator.of(context).pushNamed('/sliverBar'),
          ),

          ListTile(
            title: const Text('Sliver Transparente'),
            onTap: () => Navigator.of(context).pushNamed('/sliverTransp'),
          ),

          ListTile(
            title: const Text('Theme Screen'),
            onTap: () => Navigator.of(context).pushNamed('/themeScreen'),
          ),

          ListTile(
            title: const Text('Post-It'),
            onTap: () => Navigator.of(context).pushNamed('/postItScreen'),
          ),

          ListTile(
            title: const Text('Vendas'),
            onTap: () => Navigator.of(context).pushNamed('/dummySalesScreen'),
          ),

          ListTile(
            title: const Text('Assinatura'),
            onTap: () => Navigator.of(context).pushNamed('/signature'),
          ),

          ListTile(
            title: const Text('Mapa'),
            onTap: () => Navigator.of(context).pushNamed('/mapsScreen'),
          ),

          ListTile(
            title: const Text('Draggable'),
            onTap: () => Navigator.of(context).pushNamed('/draggableScreen'),
          ),
        ],
      ),
    );
  }
}

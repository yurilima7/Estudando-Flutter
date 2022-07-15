import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flexible & Expanded',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Flexible & Expanded'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            height: 100,
            color: Colors.red,
            child: const Text('Item 1 - pretty big!'),
          ),
          Flexible(
            flex: 4,
            fit: FlexFit.tight, // ocupa o espaço vazio
            child: Container(
              height: 100,
              color: Colors.blue,
              child: const Text('Item 2'),
            ),
          ),
          Flexible(
            flex: 1, // define quem tem maior prioridade
            fit: FlexFit.loose, // ocupa o espaço necessário
            child: Container(
              height: 100,
              color: Colors.orange,
              child: const Text('Item 3'),
            ),
          ),
        ],
      ),
    );
  }
}

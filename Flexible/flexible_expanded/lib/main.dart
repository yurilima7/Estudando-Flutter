import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flexible & Expanded',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Flexible & Expanded'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            height: 100,
            child: Text('Item 1 - pretty big!'),
            color: Colors.red,
          ),
          Flexible(
            flex: 4,
            fit: FlexFit.tight, // ocupa o espaço vazio
            child: Container(
              height: 100,
              child: Text('Item 2'),
              color: Colors.blue,
            ),
          ),
          Flexible(
            flex: 1, // define quem tem maior prioridade
            fit: FlexFit.loose, // ocupa o espaço necessário
            child: Container(
              height: 100,
              child: Text('Item 3'),
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}

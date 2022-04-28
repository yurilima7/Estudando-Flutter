import 'package:expenses/components/transaction_user.dart';
import 'package:flutter/material.dart';

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({ Key? key }) : super(key: key);

  final titleControler = TextEditingController();
  final valueControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),

      body: SingleChildScrollView(
        child: Column(   
          crossAxisAlignment: CrossAxisAlignment.stretch,
        
          children: <Widget>[
            Container(
              child: const Card(
                color: Colors.blue,
                child: Text('Gráfico'),
                elevation: 5,
              ),
            ),
        
            const TransactionUser(),
          ],
        ),
      ),
    );
  }
}
import 'package:expenses/components/transaction_form.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'models/transaction.dart';

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

class MyHomePage extends StatefulWidget {
  MyHomePage({ Key? key }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   final _transactions = [ // map de transações
    Transaction(
      id: 't1', 
      title: 'Novo Tênis de Corrida',
      value: 310.76, 
      date: DateTime.now(),
    ),

    Transaction(
      id: 't2', 
      title: 'Conta de Luz',
      value: 211.30, 
      date: DateTime.now(),
    ),
  ];

  _addTransaction(String title, double value){ // adiciona uma nova transação
    final newTransaction = Transaction( // cria objetos transactions
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() { // seta os dados informados
      _transactions.add(newTransaction);
    });
  }

  _opentransactionFormModal(BuildContext context){ // abre o modal para adição de transações
    showModalBottomSheet(
      context: context, 
      builder: (_){
        return TransactionForm(_addTransaction);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions: <Widget>[
          IconButton( // botão superior
            icon: const Icon(Icons.add),
            onPressed: () =>  _opentransactionFormModal(context), // chama a abertura do modal para inserir novas transações
          )
        ],
      ),

      body: SingleChildScrollView( // responsável pela scroll view geral da tela
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
        
           TransactionList(_transactions), // chama a exibição das listas de transações (seus cards)
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton( // botão flutuante inferior
        child: const Icon(Icons.add),
        onPressed: () =>  _opentransactionFormModal(context), // chama a abertura do modal para inserir novas transações
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, // define a localização do botão flutuante na tela
    );
  }
}
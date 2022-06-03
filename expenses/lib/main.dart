import 'package:expenses/components/chart.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'models/transaction.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  ExpensesApp({Key? key}) : super(key: key);

  final ThemeData tema = ThemeData(); // Adicionando Temas

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: Colors.purple,
          secondary: Colors.amber,
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: const TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    // map de transações
    Transaction(
      id: 't0',
      title: 'Conta Antiga',
      value: 400.00,
      date: DateTime.now().subtract(const Duration(days: 33)),
    ),

    Transaction(
      id: 't1',
      title: 'Novo Tênis de Corrida',
      value: 310.76,
      date: DateTime.now().subtract(const Duration(days: 3)),
    ),

    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 211.30,
      date: DateTime.now().subtract(const Duration(days: 4)),
    ),
  ];

  // Passando as transações recentes para o componente
  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      // filtrando as transações dos últimos 7 dias para uma lista
      return tr.date.isAfter(DateTime.now().subtract(
        const Duration(days: 7),
      ));
    }).toList();
  }

  _addTransaction(String title, double value) {
    // adiciona uma nova transação
    final newTransaction = Transaction(
      // cria objetos transactions
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      // setando os dados informados
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop(); // Fecha o modal
  }

  _opentransactionFormModal(BuildContext context) {
    // abre o modal para adição de transações
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'), // Titulo Superior
        actions: <Widget>[
          IconButton(
            // botão superior
            icon: const Icon(Icons.add),
            onPressed: () => _opentransactionFormModal(
                context), // chama a abertura do modal para inserir novas transações
          )
        ],
      ),

      body: SingleChildScrollView(
        // responsável pela scroll view geral da tela
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),

            TransactionList(
                _transactions), // chama a exibição das listas de transações (seus cards)
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        // botão flutuante inferior
        child: const Icon(Icons.add),
        onPressed: () => _opentransactionFormModal(
            context), // chama a abertura do modal para inserir novas transações
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerFloat, // define a localização do botão flutuante na tela
    );
  }
}

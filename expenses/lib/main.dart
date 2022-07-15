import 'package:expenses/components/chart.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:io';
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
      home: const MyHomePage(),
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
            button: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
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
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [];
  bool _showChart = false;

  // Passando as transações recentes para o componente
  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      // filtrando as transações dos últimos 7 dias para uma lista
      return tr.date.isAfter(DateTime.now().subtract(
        const Duration(days: 7),
      ));
    }).toList();
  }

  _addTransaction(String title, double value, DateTime date) {
    // adiciona uma nova transação
    final newTransaction = Transaction(
      // cria objetos transactions
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      // setando os dados informados
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop(); // Fecha o modal
  }

  // função responsável por deletar uma transação a partir do id da mesma
  _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

  _opentransactionFormModal(BuildContext context) {
    // abre o modal para adição de transações
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
        });
  }

  Widget _getIconButton(IconData icon, Function() fn) {
    return Platform.isIOS
        ? GestureDetector(onTap: fn, child: Icon(icon))
        : IconButton(icon: Icon(icon), onPressed: fn);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool isLanscape = mediaQuery.orientation == Orientation.landscape;

    final iconList = Platform.isIOS ? CupertinoIcons.refresh : Icons.list;
    final chartList = Platform.isIOS ? CupertinoIcons.refresh : Icons.show_chart;

    final actions = <Widget>[
      if (isLanscape)
        _getIconButton(
            // botão superior
            _showChart ? iconList : chartList, () {
          setState(() {
            _showChart = !_showChart;
          });
        }),
      _getIconButton(
        // botão superior
        Platform.isIOS ? CupertinoIcons.add : Icons.add,
        () => _opentransactionFormModal(
            context), // chama a abertura do modal para inserir novas transações
      )
    ];

    final PreferredSizeWidget appBar = AppBar(
      title: const Text('Despesas Pessoais'),
      actions: actions,
    );

    final availableHeight = mediaQuery.size.height // tamanho completo da tela
        -
        appBar.preferredSize.height // tamanho do appBar
        -
        mediaQuery.padding.top; // do topo

    final bodyPage = SafeArea(
      child: SingleChildScrollView(
        // responsável pela scroll view geral da tela
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (_showChart || !isLanscape)
              SizedBox(
                height: availableHeight *
                    (isLanscape ? 0.8 : 0.3), // tamanho do gráfico
                child: Chart(_recentTransactions),
              ),

            if (!_showChart || !isLanscape)
              SizedBox(
                height: availableHeight *
                    (isLanscape ? 1 : 0.7), // tamanho da lista
                child: TransactionList(_transactions, _removeTransaction),
              ), // chama a exibição das listas de transações (seus cards)
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: const Text('Despesas Pessoais'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: actions,
              ),
            ),
            child: bodyPage,
          )
        : Scaffold(
            appBar: appBar,
            body: bodyPage,

            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
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

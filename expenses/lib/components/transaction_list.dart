import 'package:expenses/components/transaction_item.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const TransactionList(this.transactions, this.onRemove, {Key? key})
      : super(key: key); // recebe a lista de transações

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) { // se transação vazia
            return Column(            
              children: <Widget>[
                const SizedBox(height: 20),// espaços

                Text(
                  'Nenhuma Transação Cadastrada!',
                  style: Theme.of(context).textTheme.headline6,
                ),

                const SizedBox(height: 20),// espaços
                SizedBox(
                  height: constraints.maxHeight * 0.6, // configuração de altura
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
          
          // : ListView(
          //   children: transactions.map((tr) { 
          //     return TransactionItem(
          //       tr: tr, 
          //       onRemove: onRemove, 
          //       key: ValueKey(tr.id), // chave local - preferencial
          //     );
          //   }).toList(),
          // );
          : ListView.builder(
              // caso a transação não esteja vazia
              itemCount: transactions.length, // recebe a quantidade de transações
              itemBuilder: (ctx, index) {
                final tr = transactions[index]; // recebe a transação atual

                return TransactionItem(
                  tr: tr, 
                  onRemove: onRemove, 
                  key: GlobalObjectKey(tr), // chave global - somente em casos de extrema necessidade
                );
              },
            );
  }
}

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

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

        : ListView.builder(
            // caso a transação não esteja vazia
            itemCount: transactions.length, // recebe a quantidade de transações
            itemBuilder: (ctx, index) {
              final tr = transactions[index]; // recebe a transação atual

              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),

                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.purple,
                    radius: 30,
                    
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(
                        child: Text('R\$${tr.value}'),
                      ),
                    ),
                  ),
                  // setando o titulo
                  title: Text(
                    tr.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),

                  // setando o subtitulo
                  subtitle: Text(
                    DateFormat('d MMM y').format(tr.date),
                  ),

                  // adiciona o botão de deletar
                  trailing: MediaQuery.of(context).size.width > 480 ? 
                  TextButton.icon(
                    onPressed: ()=> onRemove(tr.id), 
                    icon: const Icon(Icons.delete),
                    label: const Text("Excluir"),

                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Theme.of(context).errorColor),
                    ),
                  )
                  : IconButton(
                    icon: const Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () => onRemove(tr.id),
                  ),
                ),
              );
            },
          );
  }
}

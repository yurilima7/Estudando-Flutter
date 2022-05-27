import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;

  TransactionList(this.transactions); // recebe a lista de transações

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
        child: transactions.isEmpty ? Column( // se transação vazia
          children: <Widget> [

            const SizedBox(height: 20),

            Text(
              'Nenhuma Transação Cadastrada!',
              style: Theme.of(context).textTheme.headline6,
            ),

            const SizedBox(height: 20),

            Container(
              height: 200,
              child: Image.asset(
                'assets/images/waiting.png', 
                fit: BoxFit.cover,
              ),
            )
          ],
        ) : ListView.builder( // caso a transação não esteja vazia
          itemCount: transactions.length, // recebe a quantidade de transações
          itemBuilder: (ctx, index){
            final tr = transactions[index]; // recebe a transação atual
            return Card( // card que exibe todos os dados das transações
                  child: Row(
                    children: <Widget>[                    
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10
                        ),
      
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.purple,
                            width: 2,
                          )
                        ),
      
                        padding: const EdgeInsets.all(10),
                        
                        child: Text( // child responsável por exibir o valor
                          'R\$ ${tr.value.toStringAsFixed(2)}',
      
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple,
                          ),
                        ),
                      ),
      
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
      
                        children: <Widget>[
                          Text( // children responsável por exibir o título da transação
                            tr.title,
                            style: Theme.of(context).textTheme.headline6,
                          ),
      
                          Text( // children que exibe a data da transação
                            DateFormat('d MMM y').format(tr.date),
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
            );
          },
        ),
    );
  }
}
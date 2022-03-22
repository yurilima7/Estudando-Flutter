import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  TransactionForm({ Key? key }) : super(key: key);

  final titleControler = TextEditingController();
  final valueControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 5,

      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(  
          children: <Widget>[
            TextField(
              controller: titleControler,
              decoration: const InputDecoration(
                labelText: 'Titulo',
              ),
            ),

            TextField(
              controller: valueControler,
              decoration: const InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print(titleControler.text);
                    print(valueControler.text);
                  },

                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.purple,
                  ),

                  child: const Text('Nova Transação'),
                  
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
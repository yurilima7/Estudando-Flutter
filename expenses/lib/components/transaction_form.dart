import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  //TransactionForm({ Key? key }) : super(key: key);

  final titleControler = TextEditingController();
  final valueControler = TextEditingController();

  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

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
                    final title = titleControler.text;
                    final value = double.tryParse(valueControler.text) ?? 0.0;
                    onSubmit(title, value);
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
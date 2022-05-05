import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  //TransactionForm({ Key? key }) : super(key: key);

  final titleControler = TextEditingController();
  final valueControler = TextEditingController();

  late final void Function(String, double)? onSubmit;

  TransactionForm(this.onSubmit);

  _submitForm() {
    final title = titleControler.text;
    final value = double.tryParse(valueControler.text) ?? 0.0;

    if(title.isEmpty || value <= 0){
      return;
    }

    onSubmit!(title, value);
  }

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
              onSubmitted: (_) => _submitForm(), // submetendo titulo
              decoration: const InputDecoration(
                labelText: 'Titulo',
              ),
            ),

            TextField(
              controller: valueControler,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(), // submetendo valor
              decoration: const InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: _submitForm,

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
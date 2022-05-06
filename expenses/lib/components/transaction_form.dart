import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double)? onSubmit;

  TransactionForm(this.onSubmit); // recebe os dados pós inserção

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  //TransactionForm({ Key? key }) : super(key: key);
  final titleControler = TextEditingController();

  final valueControler = TextEditingController();

  _submitForm() { // submete as informações digitadas caso sejam válidas 
    final title = titleControler.text;
    final value = double.tryParse(valueControler.text) ?? 0.0;

    if(title.isEmpty || value <= 0){
      return;
    }

    widget.onSubmit!(title, value); // responsável por repassar as informações (ligado ao state)
  }

  @override
  Widget build(BuildContext context) {
    return  Card( // card de inserçaõ de dados
      elevation: 5,

      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(  
          children: <Widget>[
            TextField( // apresenta o texto na tela wigdet de inserção dos dados e submete os dados
              controller: titleControler,
              onSubmitted: (_) => _submitForm(), // submetendo titulo
              decoration: const InputDecoration(
                labelText: 'Titulo',
              ),
            ),

            TextField( // apresenta o texto na tela wigdet de inserção dos dados e submete os dados
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
                ElevatedButton( // botão elevedo de inserção
                  onPressed: _submitForm, // move os dados para a função responsável pela inserção pós click

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
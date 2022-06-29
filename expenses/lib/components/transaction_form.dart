import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime)? onSubmit;

  const TransactionForm(this.onSubmit, {Key? key}): super(key: key); // recebe os dados pós inserção

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
 
  final _titleControler = TextEditingController();
  final _valueControler = TextEditingController();
  var _selectedDate = DateTime.now();

  _submitForm() {
    // submete as informações digitadas caso sejam válidas
    final title = _titleControler.text;
    final value = double.tryParse(_valueControler.text) ?? 0.0;

    if (title.isEmpty || value <= 0 ) {
      return;
    }

    widget.onSubmit!(title,
        value, _selectedDate); // responsável por repassar as informações (ligado ao state)
  }

  _showDatePicker() {
    // função responsável pela seleção da data
    showDatePicker(
      // retorna algo no futuro
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      // função que será chamada na seleção da data
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      // card de inserçaõ de dados
      elevation: 5,

      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TextField(
              // apresenta o texto na tela wigdet de inserção dos dados e submete os dados
              controller: _titleControler,
              onSubmitted: (_) => _submitForm(), // submetendo titulo
              decoration: const InputDecoration(
                labelText: 'Titulo',
              ),
            ),
            TextField(
              // apresenta o texto na tela wigdet de inserção dos dados e submete os dados
              controller: _valueControler,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(), // submetendo valor
              decoration: const InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            SizedBox(
              // separando entradas dos botões
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded( // responsável por separar os elementos da tela 
                    child: Text(
                      _selectedDate == null ? 'Nenhuma data selecionada!'
                      : 'Data Selecionada: ${DateFormat('dd/MM/y').format(_selectedDate)}',
                    ),
                  ),
                  TextButton(
                    // botão de seleção de data
                    child: const Text(
                      'Selecionar Data',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    onPressed:
                        _showDatePicker, // chama função responsável pela seleção de data
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  // botão elevado de inserção
                  onPressed:
                      _submitForm, // move os dados para a função responsável pela inserção pós click

                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    onPrimary: Theme.of(context).textTheme.button?.color,
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

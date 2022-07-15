import 'package:expenses/components/adaptative_date_picker.dart';
import 'package:flutter/material.dart';
import 'adaptative_button.dart';
import 'adaptative_text_field.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime)? onSubmit;

  const TransactionForm(this.onSubmit, {Key? key})
      : super(key: key); // recebe os dados pós inserção

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

    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.onSubmit!(title, value,
        _selectedDate); // responsável por repassar as informações (ligado ao state)
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        // card de inserção de dados
        elevation: 5,

        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 +
                MediaQuery.of(context)
                    .viewInsets
                    .bottom, // 10 + tamanho da altura do teclado
          ),
          child: Column(
            children: <Widget>[
              AdaptativeTextField(
                controller: _titleControler,
                onSubmitted: (_) => _submitForm(),
                label: 'Titulo',
              ),

              AdaptativeTextField(
                label: 'Valor (R\$)',
                controller: _valueControler,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitForm(), // submetendo valor
              ),

              AdaptativeDatePicker(
                selectedDate: _selectedDate,
                onDateChanged: (newDate) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                },
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AdaptativeButton('Nova Transação', _submitForm),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

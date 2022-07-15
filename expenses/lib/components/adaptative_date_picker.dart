import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'dart:io';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateChanged;

  const AdaptativeDatePicker({
    required this.selectedDate,
    required this.onDateChanged,
    Key? key,
  }) : super(key: key);

  _showDatePicker(BuildContext context) {
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

      onDateChanged(pickedDate);
     
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? SizedBox(
          height: 180,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: DateTime.now(),
            minimumDate: DateTime(2019),
            maximumDate: DateTime.now(),
            onDateTimeChanged: onDateChanged,
          ),
        )
        : SizedBox(
            // separando entradas dos botões
            height: 70,
            child: Row(
              children: <Widget>[
                Expanded(
                  // responsável por separar os elementos da tela
                  child: Text(
                    'Data Selecionada: ${DateFormat('dd/MM/y').format(selectedDate)}',
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

                  onPressed: () => _showDatePicker(
                      context), // chama função responsável pela seleção de data
                )
              ],
            ),
          );
  }
}

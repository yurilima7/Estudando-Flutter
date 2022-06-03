import 'package:expenses/components/chart_bar.dart';
import 'package:expenses/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  //const Chart({Key? key}) : super(key: key);

  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransactions {
    // retorna uma list e dentro dessa list um map
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for (var i = 0; i < recentTransaction.length; i++) {
        bool sameDay = recentTransaction[i].date.day ==
            weekDay.day; // Pega o dia da última semana
        bool sameMounth = recentTransaction[i].date.month == weekDay.month;
        bool sameYear = recentTransaction[i].date.year == weekDay.year;

        // se for mesmo dia, mês e ano pode somar para week day
        if (sameDay && sameMounth && sameYear) {
          totalSum += recentTransaction[i].value;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay)[
            0], // Pegando a primeira letra do dia da semana selecionado
        'value': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    groupedTransactions;
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
        // colocando dia, valor e porcentagem dentro do card
        children: groupedTransactions.map((tr) {
          return ChartBar(
            label: tr['day'].toString(), 
            value: double.parse(tr['value'].toString()), 
            percentage: 0,
          );
        }).toList(),
      ),
    );
  }
}

import 'package:expenses/components/chart_bar.dart';
import 'package:expenses/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  const Chart(this.recentTransaction, {Key? key}) : super(key: key);

  List<Map<String, dynamic>> get groupedTransactions {
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
    }).reversed.toList(); // reverte a lista
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (sum, tr) {
      // sum - acumulador de soma dos valores da transação, tr - elemento atual
      return sum + tr['value'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // colocando dia, valor e porcentagem dentro do card
          children: groupedTransactions.map((tr) {
            return Flexible(
              fit: FlexFit.tight, // distância iguais entre os elementos

              child: ChartBar(
                label: tr['day'].toString(),
                value: double.parse(tr['value'].toString()),
                percentage: _weekTotalValue == 0
                    ? 0
                    : (tr['value'] as double) / _weekTotalValue,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

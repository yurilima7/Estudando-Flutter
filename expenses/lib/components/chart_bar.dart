import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChartBar extends StatelessWidget {
  //const ChartBar({Key? key}) : super(key: key);

  final String label;
  final double value;
  final double percentage;

  const ChartBar({required this.label, required this.value, required this.percentage});

  @override
  Widget build(BuildContext context) {
    // gráfico de dados
    return Column(
      children: <Widget>[
        Text('R\$${value.toStringAsFixed(2)}'),
        const SizedBox(
          height: 5,
        ),

        Container(
          height: 60,
          width: 10,
          child: null,
        ),
        
        const SizedBox(
          height: 5,
        ),
        Text(label),
      ],
    );
  }
}

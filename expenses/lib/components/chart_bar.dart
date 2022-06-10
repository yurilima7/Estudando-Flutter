import 'package:flutter/material.dart';

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
        FittedBox( // diminui o valor do texto para se adequar na tela
          child: Text('${value.toStringAsFixed(2)}'),
        ),
        const SizedBox(
          height: 5,
        ),

        SizedBox(
          height: 60,
          width: 10,
          // barras
          child: Stack( // permite colocar um componente em cima do outro

            alignment: Alignment.bottomCenter, // Responsável por jogar o gráfico para baixo

            children: <Widget>[

              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),

                  color: const Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),

              // responsável por pintar de acorddo com a porcentagem
              FractionallySizedBox(
                heightFactor: percentage,

                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}

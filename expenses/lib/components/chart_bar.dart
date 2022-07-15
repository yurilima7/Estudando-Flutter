import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percentage;

  const ChartBar(
      {required this.label,
      required this.value,
      required this.percentage,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // gráfico de dados
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: <Widget>[
            SizedBox(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                // diminui o valor do texto para se adequar na tela
                child: Text(value.toStringAsFixed(2)),
              ),
            ),

            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),

            SizedBox(
              height: constraints.maxHeight * 0.6,
              width: 10,
              // barras
              child: Stack(
                // permite colocar um componente em cima do outro

                alignment: Alignment
                    .bottomCenter, // Responsável por jogar o gráfico para baixo

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

                  // responsável por pintar de acordo com a porcentagem
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
            SizedBox(height: constraints.maxHeight * 0.05),
            SizedBox(height: constraints.maxHeight * 0.15, child: FittedBox(child: Text(label))),
          ],
        );
      },
    );
  }
}

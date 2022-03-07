import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  //const Questionario({ Key? key }) : super(key: key);

  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder,
  });

  bool get temPerguntaSelecionada{
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada ? perguntas[perguntaSelecionada].cast()['respostas'] 
    : [];

    List<Widget> widgets = respostas.map((resp) {
      return Resposta(
        resp['texto'].toString(), 
        () => quandoResponder(int.parse(resp['pontuacao'].toString())),
      );
    }).toList();

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...widgets,
      ],
    );
  }
}
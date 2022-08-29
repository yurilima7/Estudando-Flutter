import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {

  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  const Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder,Key? key})
      : super(key: key);

  bool get temPerguntaSelecionada{
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada ? perguntas[perguntaSelecionada].cast()['respostas'] 
    : [];

    List<Widget> widgets = respostas.map((resp) {
      return Resposta(
        texto: resp['texto'].toString(), 
        quandoSelecionado: () => quandoResponder(int.parse(resp['pontuacao'].toString())),
      );
    }).toList();

    return Column(
      children: [
        Questao(texto: perguntas[perguntaSelecionada]['texto'].toString()),
        ...widgets,
      ],
    );
  }
}
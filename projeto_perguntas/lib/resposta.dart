import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  
  final String texto;

  final void Function() quandoSelecionado;

  const Resposta({required this.texto, required this.quandoSelecionado, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context){
    return SizedBox(

      width: double.infinity,

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          textStyle: const TextStyle(color: Colors.amberAccent)
        ),

        child: Text(texto),
        onPressed: quandoSelecionado,
      ),
    );
  }
}
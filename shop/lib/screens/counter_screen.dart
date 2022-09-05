import 'package:flutter/material.dart';
import 'package:shop/providers/counter.dart';

class CounterScreen extends StatefulWidget {

  const CounterScreen({Key? key})
      : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exemplo Contador"),
      ),

      body: Column(

        children: [
          Text(CounterProvider.of(context)?.state.value.toString() ?? '0'),

          IconButton(
            onPressed: (){
              setState(() {
                CounterProvider.of(context)?.state.inc();
              });
            }, 
            icon: const Icon(Icons.add),
          ),

          IconButton(
            onPressed: (){
              setState(() {
                CounterProvider.of(context)?.state.dec();
              });
            }, 
            icon: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

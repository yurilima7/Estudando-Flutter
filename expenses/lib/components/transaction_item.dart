import 'dart:math';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  final Transaction tr;
  final void Function(String) onRemove;

  const TransactionItem({
    Key? key,
    required this.tr,
    required this.onRemove,
  }) : super(key: key);

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {

  static const colors = [
    Colors.red,
    Colors.purple,
    Colors.orange,
    Colors.blue,
    Colors.black,
  ];

  late Color _backgroundColor;

  @override
  void initState() {
    int i = Random().nextInt(5);
    _backgroundColor = colors[i];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),

      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _backgroundColor,
          radius: 30,
          
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text('R\$${widget.tr.value}'),
            ),
          ),
        ),
        // setando o titulo
        title: Text(
          widget.tr.title,
          style: Theme.of(context).textTheme.headline6,
        ),

        // setando o subtitulo
        subtitle: Text(
          DateFormat('d MMM y').format(widget.tr.date),
        ),

        // adiciona o botão de deletar
        trailing: MediaQuery.of(context).size.width > 480 ? 
        TextButton.icon(
          onPressed: ()=> widget.onRemove(widget.tr.id), 
          icon: const Icon(Icons.delete),
          label: const Text("Excluir"),

          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Theme.of(context).errorColor),
          ),
        )
        : IconButton(
          icon: const Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () => widget.onRemove(widget.tr.id),
        ),
      ),
    );
  }
}
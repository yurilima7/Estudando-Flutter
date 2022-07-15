import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class AdaptativeTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String) onSubmitted;

  const AdaptativeTextField({
    required this.controller,
    this.keyboardType = TextInputType.text,
    required this.onSubmitted,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: CupertinoTextField(
            controller: controller,
            keyboardType: keyboardType,
            onSubmitted: onSubmitted, // submetendo valor
            placeholder: label,
            padding: const EdgeInsets.symmetric(
              horizontal: 6,
              vertical: 12,
            ),
          ),
        )
      : TextField(
          // apresenta o texto na tela wigdet de inserção dos dados e submete os dados
          controller: controller,
          keyboardType: keyboardType,
          onSubmitted: onSubmitted, // submetendo valor
          decoration: InputDecoration(
            labelText: label,
          ),
        );
  }
}

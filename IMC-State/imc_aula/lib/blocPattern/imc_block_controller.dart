import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:imc_aula/blocPattern/imc_state.dart';

class ImcBlockController {
  final _imcStreamController = StreamController<ImcState>.broadcast()
    ..add(ImcState(imc: 0));

  Stream<ImcState> get imcOut => _imcStreamController.stream;

  Future<void> calcularImc(
      {required double peso, required double altura}) async {
    try {
      _imcStreamController.add(ImcStateLoading());
      await Future.delayed(const Duration(seconds: 1));
      final imc = peso / pow(altura, 2);
      _imcStreamController.add(ImcState(imc: imc));
    } on Exception catch (e) {
      _imcStreamController.add(ImcStateError(message: 'Erro ao calcular imc'));
      debugPrint(e.toString());
    }
  }

  void dispose() {
    _imcStreamController.close();
  }
}

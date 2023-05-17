import 'package:flutter/material.dart';

class ProviderController extends ChangeNotifier {
  String name = 'Nome';
  String imgAvatar = 'https://pbs.twimg.com/media/Evh5xcjUUAIfHRK.jpg';
  String birthDay = 'Data';

  void alterarDados() {
    name = 'Hunter';
    imgAvatar = 'https://pbs.twimg.com/media/Evh5xcjUUAIfHRK.jpg';
    birthDay = '27/03/2002';
    notifyListeners();
  }
  void alterarNome() {
    name = 'Mark Webb';
    notifyListeners();
  }
}

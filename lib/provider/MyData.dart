import 'package:flutter/material.dart' show ChangeNotifier;

class MyData extends ChangeNotifier {
  String data = 'Your data here';

  void updateDataWithUri(String newData) {
    data = newData;
    notifyListeners();
  }
}
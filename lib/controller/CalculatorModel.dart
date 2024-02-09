import 'package:flutter/material.dart';

class CalculatorModel extends ChangeNotifier {
  double _result = 0.0;

  double get result => _result;

  set result(double value) {
    _result = value;
    notifyListeners();
  }
}

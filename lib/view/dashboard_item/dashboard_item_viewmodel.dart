import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class DashboardItemViewModel extends BaseViewModel {
  double _sliderValue = 0;
  double get sliderValue => _sliderValue;
  final List<Color> colores = [
    Colors.black,
    Colors.blue,
    Colors.yellow,
    Colors.green,
    Colors.cyan,
    Colors.indigo,
    Colors.brown,
    Colors.teal,
    Colors.blueAccent
  ];
  Color _color = Colors.black;
  Color get color => _color;
  void update(double value) {
    _sliderValue = value;
    //Este metodo es de stack y lo que hace es un setState, es decir, reconstruye la vista
    rebuildUi();
  }

  void changeColor(int value) {
    _color = colores[value];
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class DashboardItemViewModel extends BaseViewModel {
  //Lista de widgets
  List<Type> widgets = [];
  //Gauge
  double sliderValue = 0;
  List<Color> colores = [
    Colors.lightBlue,
    Colors.blue,
    Colors.yellow,
    Colors.green,
    Colors.cyan,
    Colors.indigo,
    Colors.brown,
    Colors.teal,
    Colors.blueAccent
  ];
  Color color = Colors.lightBlue;
  //QR
  String url = 'https://www.procisa.es/';
  //All Chart
  List<ChartData> valoresChart = [
    ChartData('Jan', 35),
    ChartData('Feb', 28),
    ChartData('Mar', 34),
    ChartData('Apr', 32),
    ChartData('May', 40)
  ];
  //SfDateRangePicker
  String _diaSeleccionado = '';
  String get diaSeleccionado => _diaSeleccionado;
  void updateDiaSeleccionado(String value) {
    _diaSeleccionado = value;
    notifyListeners();
  }

  void update(double value) {
    sliderValue = value;
    notifyListeners();
  }

  void changeColor(int value) {
    color = colores[value];
    notifyListeners();
  }
}

//CartesianChart
class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}

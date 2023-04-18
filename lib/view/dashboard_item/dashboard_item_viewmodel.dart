import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../dashboard_item_widget/LinearGauge.dart';

class DashboardItemViewModel extends BaseViewModel {
  //Lista de widgets
  List<Type> widgets=[];
  //Gauge
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
  //QR
  final String _url = 'https://www.procisa.es/';
  String get url => _url;
  //All Chart
  final List<ChartData> _valoresChart = [
    ChartData('Jan', 35),
    ChartData('Feb', 28),
    ChartData('Mar', 34),
    ChartData('Apr', 32),
    ChartData('May', 40)
  ];
  List<ChartData> get valoresChart => _valoresChart;
  //SfDateRangePicker
  String _diaSeleccionado = '';
  String get diaSeleccionado => _diaSeleccionado;
  void updateDiaSeleccionado(String value) {
    _diaSeleccionado = value;
    notifyListeners();
  }

  void update(double value) {
    _sliderValue = value;
    notifyListeners();
  }

  void changeColor(int value) {
    _color = colores[value];
    notifyListeners();
  }
}

//CartesianChart
class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}

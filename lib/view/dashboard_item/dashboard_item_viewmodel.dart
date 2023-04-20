import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../data/model/chart_data.dart';

class DashboardItemViewModel extends BaseViewModel {
  //Lista de widgets
  List<Type> widgets = [];
  //Gauge
  int minimo = 0;
  int maximo = 150;
  double value = 0;
  LinearGaugeOrientation orientacion = LinearGaugeOrientation.horizontal;

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
  //Valores por defecto
  List<ChartData> valoresChart = [
    ChartData('Jan', 35),
    ChartData('Feb', 28),
    ChartData('Mar', 34),
    ChartData('Apr', 32),
    ChartData('May', 40)
  ];
  void updateValores(List<ChartData> v) {
    valoresChart=[];
    valoresChart=v;
    notifyListeners();
  }
  //SfDateRangePicker
  String diaSeleccionado = '';
  void updateDiaSeleccionado(String value) {
    diaSeleccionado = value;
    notifyListeners();
  }

  void update(double v) {
    value = v;
    notifyListeners();
  }

  void changeColor(int value) {
    color = colores[value];
    notifyListeners();
  }
}
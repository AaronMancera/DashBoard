import 'package:stacked/stacked.dart';

class AlertDialogViewModel extends BaseViewModel {
  //Todos los nombres/identificadores de widgets estan aqui
  String widgetSelecionado = "Ninguno";
  List<String> widgestDisponibles = [
    "Ninguno",
    "Qr",
    "Gauge",
    "Cartesian",
    "Circular",
    'Pyramid',
    'Funnel',
    'DateRangePicker',
    'RadialGauge'
  ];
  //Se actualiza el widget selecionado
  void widgetSelected(String value) {
    widgetSelecionado = value;
    notifyListeners();
  }
  //Muestra unicamente aquellos que aun no estan mostrandose en pantalla
  void restantes(List<String> valores) {
    widgestDisponibles.removeWhere((element) => valores.contains(element));
  }
}

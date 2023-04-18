import 'package:stacked/stacked.dart';

class AlertDialogViewModel extends BaseViewModel {
  //TODO: Selector de widget
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

  void widgetSelected(String value) {
    widgetSelecionado = value;
    // print(widgetSelecionado);
    notifyListeners();
  }

  void restantes(List<String> valores) {
    widgestDisponibles.removeWhere((element) => valores.contains(element));
  }
}

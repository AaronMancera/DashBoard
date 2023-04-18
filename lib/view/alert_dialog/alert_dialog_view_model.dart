
import 'package:stacked/stacked.dart';

class AlertDialogViewModel extends BaseViewModel {
  //TODO: Selector de widget
  String widgetSelecionado = "Ninguno";
  List<String> widgestDisponibles = ["Ninguno", "Gauge", "Cartesian","Circular"];
  void widgetSelected(String value) {
    widgetSelecionado = value;
    // print(widgetSelecionado);
    notifyListeners();
  }
}

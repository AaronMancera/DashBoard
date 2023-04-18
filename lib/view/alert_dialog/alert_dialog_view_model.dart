import 'package:dashboard/dashboard.dart';
import 'package:niveles_formacion/data/model/dashboard_panel_item/dashboard_panel_item.dart';
import 'package:niveles_formacion/data/model/dashboard_panel_item_level/dashboard_panel_item_level.dart';
import 'package:niveles_formacion/data/model/dashboard_panel_item_level/dashboard_panel_item_level_options.dart';
import 'package:stacked/stacked.dart';

class AlertDialogViewModel extends BaseViewModel {
  //TODO: Selector de widget
  String widgetSelecionado = "Ninguno";
  List<String> widgestDisponibles = ["Ninguno", "Gauge", "Cartesian"];
  void widgetSelected(String value) {
    widgetSelecionado = value;
    // print(widgetSelecionado);
    notifyListeners();
  }
}

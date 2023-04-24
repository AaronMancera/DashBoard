import 'package:dashboard/dashboard.dart';
import 'package:niveles_formacion/data/model/dashboard_panel_item/dashboard_panel_item.dart';
import 'package:niveles_formacion/data/model/dashboard_panel_item_level/dashboard_panel_item_level.dart';
import 'package:niveles_formacion/data/model/dashboard_panel_item_level/dashboard_panel_item_level_options.dart';
import 'package:stacked/stacked.dart';

class DashboardViewModel extends BaseViewModel {
  //XXX: Si no se inicializa con un item da fallo
  final DashboardItemController<DashboardPanelItem> dashboardItemController =
      DashboardItemController(items: [
    DashboardPanelItemLevel(
        identifier: "Qr",
        height: 5,
        width: 3,
        //Para el valor minimo de alto y ancho es desde la clase DashboardPanelItemLevel y DashboardPanelItem
        minHeight: 4,
        minWidth: 2,
        panelOptions: DashboardPanelItemLevelOptions(
          uid: 'optionsIdentifier',
        )),
  ]);
  //Menu desplegable
  bool activado = false;
  void changeTools() {
    if (!activado) {
      activado = true;
    } else {
      activado = false;
    }
    notifyListeners();
  }

  //Cambiar al modo edicion
  void changeEditMode() {
    dashboardItemController.isEditing = !dashboardItemController.isEditing;
    notifyListeners();
  }

  //Devolucion del selector de widget para añadir
  Map<String, dynamic> widget = {};
  void addQr() {
    DashboardPanelItemLevel qr = DashboardPanelItemLevel(
        identifier: "Qr",
        height: 5,
        width: 3,
        //Para el valor minimo de alto y ancho es desde la clase DashboardPanelItemLevel y DashboardPanelItem
        minHeight: 4,
        minWidth: 2,
        panelOptions: DashboardPanelItemLevelOptions(
          uid: 'optionsIdentifier',
        ));
    if (dashboardItemController.items.contains(qr.identifier)) {
      // Ya tiene el item dentro
      return;
    }
    dashboardItemController.add(qr);
    notifyListeners();
  }

  //TODO: Hay que poner una variable que cambie el alto de este item dependiendo si ha selecionado horizontal o vertical
  void addGauge() {
    DashboardPanelItemLevel gauge = DashboardPanelItemLevel(
        identifier: "Gauge",
        height: 5,
        width: 8,
        minWidth: 4,
        minHeight: 5,
        panelOptions: DashboardPanelItemLevelOptions(uid: 'optionsIdentifier'));
    if (dashboardItemController.items.contains(gauge.identifier)) {
      // Ya tiene el item dentro
      return;
    }
    dashboardItemController.add(gauge);
    notifyListeners();
  }

  void addCartesianChart() {
    DashboardPanelItemLevel cartesianChart = DashboardPanelItemLevel(
        identifier: "Cartesian",
        height: 4,
        width: 5,
        minHeight: 4,
        minWidth: 5,
        panelOptions: DashboardPanelItemLevelOptions(uid: 'optionsIdentifier'));
    if (dashboardItemController.items.contains(cartesianChart.identifier)) {
      // Ya tiene el item dentro
      return;
    }
    dashboardItemController.add(cartesianChart);
    notifyListeners();
  }

  void addCircularChart() {
    DashboardPanelItemLevel circularChart = DashboardPanelItemLevel(
        identifier: "Circular",
        height: 4,
        width: 4,
        minWidth: 4,
        minHeight: 4,
        panelOptions: DashboardPanelItemLevelOptions(uid: 'optionsIdentifier'));
    if (dashboardItemController.items.contains(circularChart.identifier)) {
      // Ya tiene el item dentro
      return;
    }
    dashboardItemController.add(circularChart);
    notifyListeners();
  }

  void addPyramidChart() {
    DashboardPanelItemLevel pyramidChart = DashboardPanelItemLevel(
        identifier: "Pyramid",
        height: 3,
        width: 4,
        minWidth: 4,
        minHeight: 3,
        panelOptions: DashboardPanelItemLevelOptions(uid: 'optionsIdentifier'));
    if (dashboardItemController.items.contains(pyramidChart.identifier)) {
      // Ya tiene el item dentro
      return;
    }
    dashboardItemController.add(pyramidChart);
    notifyListeners();
  }

  void addFunnelChart() {
    DashboardPanelItemLevel funnelChart = DashboardPanelItemLevel(
        identifier: "Funnel",
        height: 3,
        width: 4,
        minWidth: 4,
        minHeight: 3,
        panelOptions: DashboardPanelItemLevelOptions(uid: 'optionsIdentifier'));
    if (dashboardItemController.items.contains(funnelChart.identifier)) {
      // Ya tiene el item dentro
      return;
    }
    dashboardItemController.add(funnelChart);
    notifyListeners();
  }

  void addDateRangePicker() {
    DashboardPanelItemLevel dateRangePicker = DashboardPanelItemLevel(
        identifier: "DateRangePicker",
        height: 4,
        width: 4,
        minWidth: 4,
        minHeight: 4,
        panelOptions: DashboardPanelItemLevelOptions(uid: 'optionsIdentifier'));
    if (dashboardItemController.items.contains(dateRangePicker.identifier)) {
      // Ya tiene el item dentro
      return;
    }
    dashboardItemController.add(dateRangePicker);
    notifyListeners();
  }

  //No se utiliza
  void addRadialGauge() {
    DashboardPanelItemLevel radialGauge = DashboardPanelItemLevel(
        identifier: "RadialGauge",
        height: 4,
        width: 4,
        minWidth: 4,
        minHeight: 4,
        panelOptions: DashboardPanelItemLevelOptions(uid: 'optionsIdentifier'));
    if (dashboardItemController.items.contains(radialGauge.identifier)) {
      // Ya tiene el item dentro
      return;
    }
    dashboardItemController.add(radialGauge);
    notifyListeners();
  }

  //Eliminar el widget
  void eliminarWidget(DashboardPanelItem item) {
    dashboardItemController.delete(item.identifier);
    notifyListeners();
  }
}

import 'package:dashboard/dashboard.dart';
import 'package:niveles_formacion/data/model/dashboard_panel_item/dashboard_panel_item.dart';
import 'package:niveles_formacion/data/model/dashboard_panel_item_level/dashboard_panel_item_level.dart';
import 'package:niveles_formacion/data/model/dashboard_panel_item_level/dashboard_panel_item_level_options.dart';
import 'package:stacked/stacked.dart';

class DashboardViewModel extends BaseViewModel {
  //TODO: Cambiar todo para añadir y eliminar
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
  // final DashboardItemController<DashboardPanelItem> dashboardItemController =
  //     DashboardItemController(items: [
  //   // // DashboardPanelItemLevel(
  //   // //     identifier: "Gauge1",
  //   // //     height: 1,
  //   // //     width: 8,
  //   // //     panelOptions: DashboardPanelItemLevelOptions(uid: 'optionsIdentifier')),
  //   // DashboardPanelItemLevel(
  //   //     identifier: "Qr1",
  //   //     height: 2,
  //   //     width: 1,
  //   //     panelOptions: DashboardPanelItemLevelOptions(uid: 'optionsIdentifier')),
  //   // DashboardPanelItemLevel(
  //   //     identifier: "CartesianChart1",
  //   //     height: 2,
  //   //     width: 2,
  //   //     panelOptions: DashboardPanelItemLevelOptions(uid: 'optionsIdentifier')),
  //   // DashboardPanelItemLevel(
  //   //     identifier: "CircularChart1",
  //   //     height: 2,
  //   //     width: 2,
  //   //     panelOptions: DashboardPanelItemLevelOptions(uid: 'optionsIdentifier')),
  //   // DashboardPanelItemLevel(
  //   //     identifier: "PyramidChart1",
  //   //     height: 2,
  //   //     width: 2,
  //   //     panelOptions: DashboardPanelItemLevelOptions(uid: 'optionsIdentifier')),
  //   // DashboardPanelItemLevel(
  //   //     identifier: "FunnelChart1",
  //   //     height: 2,
  //   //     width: 2,
  //   //     panelOptions: DashboardPanelItemLevelOptions(uid: 'optionsIdentifier')),
  //   // DashboardPanelItemLevel(
  //   //     identifier: "DateRangePicker1",
  //   //     height: 2,
  //   //     width: 2,
  //   //     panelOptions: DashboardPanelItemLevelOptions(uid: 'optionsIdentifier')),
  //   // DashboardPanelItemLevel(
  //   //     identifier: "RadialGauge1",
  //   //     height: 2,
  //   //     width: 2,
  //   //     panelOptions: DashboardPanelItemLevelOptions(uid: 'optionsIdentifier')),
  // ]);
  //TODO: Hacer un menu desplegable con las herramientas
  bool activado = false;
  void changeTools() {
    if (!activado) {
      activado = true;
    } else {
      activado = false;
    }
    notifyListeners();
  }

  void changeEditMode() {
    dashboardItemController.isEditing = !dashboardItemController.isEditing;
    notifyListeners();
  }

  //TODO: Selector de widget
  String widget = "Ninguno";

  void addGauge() {
    DashboardPanelItemLevel gauge = DashboardPanelItemLevel(
        identifier: "Gauge",
        height: 1,
        width: 8,
        minWidth: 4,
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
        height: 3,
        width: 4,
        minWidth: 4,
        minHeight: 3,
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
        height: 3,
        width: 4,
        minWidth: 4,
        minHeight: 3,
        panelOptions: DashboardPanelItemLevelOptions(uid: 'optionsIdentifier'));
    if (dashboardItemController.items.contains(dateRangePicker.identifier)) {
      // Ya tiene el item dentro
      return;
    }
    dashboardItemController.add(dateRangePicker);
    notifyListeners();
  }
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
}

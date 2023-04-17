import 'package:dashboard/dashboard.dart';
import 'package:niveles_formacion/data/model/dashboard_panel_item/dashboard_panel_item.dart';
import 'package:niveles_formacion/data/model/dashboard_panel_item_level/dashboard_panel_item_level.dart';
import 'package:niveles_formacion/data/model/dashboard_panel_item_level/dashboard_panel_item_level_options.dart';
import 'package:stacked/stacked.dart';

class DashboardViewModel extends BaseViewModel {
  //DEPRECATED: No funciona el tamaño minimo y a la hora de insertar, si esta vacio el dashboardItemController salta un error
  final DashboardItemController<DashboardPanelItem> dashboardItemController =
      DashboardItemController(items: [
    DashboardPanelItemLevel(
        identifier: "Qr1",
        height: 5,
        width: 3,
        panelOptions: DashboardPanelItemLevelOptions(
          uid: 'optionsIdentifier',
          minHeight: 4,
          minWidth: 2,
        ))
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

  void changeEditMode() {
    dashboardItemController.isEditing = !dashboardItemController.isEditing;
    notifyListeners();
  }

  void addGauge() {
    dashboardItemController.add(DashboardPanelItemLevel(
        identifier: "Gauge1",
        height: 1,
        width: 8,
        panelOptions:
            DashboardPanelItemLevelOptions(uid: 'optionsIdentifier')));

    notifyListeners();
  }
}

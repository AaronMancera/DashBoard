import 'package:flutter/material.dart';
import 'package:niveles_formacion/data/model/dashboard_panel_item/dashboard_panel_item.dart';
import 'package:niveles_formacion/view/dashboard/dashboard_viewmodel.dart';
import 'package:niveles_formacion/view/dashboard_item/dashboard_item_view.dart';
import 'package:stacked/stacked.dart';
import 'package:dashboard/dashboard.dart';

import '../alert_dialog/alert_dialog_view.dart';

class DashboardView extends StackedView<DashboardViewModel> {
  const DashboardView({super.key});

  @override
  Widget builder(
      BuildContext context, DashboardViewModel viewModel, Widget? child) {
    return Scaffold(
        floatingActionButton: !viewModel.activado
            ? Stack(
                children: [
                  Positioned(
                    bottom: 10.0,
                    right: 10.0,
                    child: FloatingActionButton(
                        child: const Icon(Icons.turn_left_outlined),
                        onPressed: () => viewModel.changeTools()),
                  )
                ],
              )
            : Stack(
                children: [
                  Positioned(
                    bottom: 10.0,
                    right: 10.0,
                    child: FloatingActionButton(
                        child: const Icon(Icons.present_to_all),
                        onPressed: () => viewModel.changeTools()),
                  ),
                  Positioned(
                    bottom: 10.0,
                    right: 80.0,
                    child: FloatingActionButton(
                        child: const Icon(Icons.edit),
                        onPressed: () => viewModel.changeEditMode()),
                  ),
                  Positioned(
                    bottom: 10.0,
                    right: 150.0,
                    child: FloatingActionButton(
                        child: const Icon(Icons.add),
                        onPressed: () async {
                          //Dialogo selector
                          // Variable del viewmodel que sera adignado a traves de la devolucion del dialogo
                          viewModel.widget = "Ninguno";
                          viewModel.widget = await showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) => AlertDialogView(viewModel));

                          switch (viewModel.widget) {
                            case "Qr":
                              viewModel.addQr();
                              break;
                            case "Gauge":
                              viewModel.addGauge();
                              break;
                            case "Cartesian":
                              viewModel.addCartesianChart();
                              break;
                            case "Circular":
                              viewModel.addCircularChart();
                              break;
                            case "Pyramid":
                              viewModel.addPyramidChart();
                              break;
                            case "Funnel":
                              viewModel.addFunnelChart();
                              break;
                            case "DateRangePicker":
                              viewModel.addDateRangePicker();
                              break;
                            case "RadialGauge":
                              viewModel.addRadialGauge();
                              break;
                            default:
                              return;
                          }
                        }),
                  ),
                ],
              ),
        body: Center(
            child: Dashboard<DashboardPanelItem>(
                editModeSettings: EditModeSettings(resizeCursorSide: 10),
                //Devuelve el mapa de paneles del dashboard para ser procesados por el dashboard_item_view
                itemBuilder: (item) => DashboardItemView(item, viewModel),
                //Controlador del dashboard
                dashboardItemController: viewModel.dashboardItemController)));
  }

  @override
  DashboardViewModel viewModelBuilder(BuildContext context) =>
      DashboardViewModel();
}

//TODO: Crear un dialogo que detecte que opcion habian selecionado añadir y personalice la creacion
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import '../dashboard/dashboard_viewmodel.dart';
import 'alert_dialog_item_viewmodel.dart';

class AlertDialogItemView extends StackedView<AlertDialogItemViewModel> {
  const AlertDialogItemView(this.dashboardViewModel, {super.key});
  final DashboardViewModel dashboardViewModel;

  @override
  Widget builder(
      BuildContext context, AlertDialogItemViewModel viewModel, Widget? child) {
    return AlertDialog(
      title: const Text('Selector de widget'),
      content: Text("Hola"),
      actions: [
        TextButton(
            child: const Text("Aceptar"),
            onPressed: () {
              switch (dashboardViewModel.widget) {
                case "Qr":
                  dashboardViewModel.addQr();
                  break;
                case "Gauge":
                  dashboardViewModel.addGauge();
                  break;
                case "Cartesian":
                  dashboardViewModel.addCartesianChart();
                  break;
                case "Circular":
                  dashboardViewModel.addCircularChart();
                  break;
                case "Pyramid":
                  dashboardViewModel.addPyramidChart();
                  break;
                case "Funnel":
                  dashboardViewModel.addFunnelChart();
                  break;
                case "DateRangePicker":
                  dashboardViewModel.addDateRangePicker();
                  break;
                case "RadialGauge":
                  dashboardViewModel.addRadialGauge();
                  break;
                default:
                  return;
              }
              Navigator.of(context).pop();
            }),
        TextButton(
            child: const Text("Cancelar"),
            onPressed: () {
              Navigator.of(context).pop("Ninguno");
            }),
      ],
    );
  }

  @override
  AlertDialogItemViewModel viewModelBuilder(BuildContext context) =>
      AlertDialogItemViewModel();
}

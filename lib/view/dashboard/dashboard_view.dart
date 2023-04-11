import 'package:flutter/material.dart';
import 'package:niveles_formacion/data/model/dashboard_panel_item/dashboard_panel_item.dart';
import 'package:niveles_formacion/view/dashboard/dashboard_viewmodel.dart';
import 'package:niveles_formacion/view/dashboard_item/dashboard_item_view.dart';
import 'package:stacked/stacked.dart';
import 'package:dashboard/dashboard.dart';

class DashboardView extends StackedView<DashboardViewModel> {
  const DashboardView({super.key});

  @override
  Widget builder(
      BuildContext context, DashboardViewModel viewModel, Widget? child) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.edit),
            onPressed: () => viewModel.changeEditMode()),
        body: Center(
            child: Dashboard<DashboardPanelItem>(
                editModeSettings: EditModeSettings(resizeCursorSide: 10),
                //Devuelve el mapa de paneles del dashboard para ser procesados por el dashboard_item_view
                itemBuilder: (item) => DashboardItemView(item),
                //Controlador del dashboard
                dashboardItemController: viewModel.dashboardItemController)));
  }

  @override
  DashboardViewModel viewModelBuilder(BuildContext context) =>
      DashboardViewModel();
}

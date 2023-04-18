import 'package:flutter/material.dart';
import 'package:niveles_formacion/data/model/dashboard_panel_item/dashboard_panel_item.dart';
import 'package:niveles_formacion/view/dashboard/dashboard_viewmodel.dart';
import 'package:niveles_formacion/view/dashboard_item/dashboard_item_view.dart';
import 'package:stacked/stacked.dart';
import 'package:dashboard/dashboard.dart';

import '../dashboard_widget/dropdown_button.dart';

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
                    right: 160.0,
                    child: FloatingActionButton(
                        child: const Icon(Icons.add),
                        onPressed: () {
                          //Dialogo selector
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text('Selector de widget'),
                                    //TODO:Selector
                                    content: DropdownButtonWidget(),
                                    //TODO: Realizar la accion de añadir
                                    actions: [
                                      TextButton(
                                          child: Text("Aceptar"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          }),
                                      TextButton(
                                          child: Text("Cancelar"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          }),
                                    ],
                                  ));
                        }),
                  ),
                ],
              ),
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
